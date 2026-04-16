// routes/dbManager.js — HTTP layer only; all SQL is in queries/dbManager.js
const express  = require('express');
const crypto   = require('crypto');
const q        = require('../queries/dbManager');
const { requireLogin } = require('../middleware/auth');
const router   = express.Router();
const guard    = requireLogin('db_manager');

function hashPassword(plain) {
  return crypto.createHash('sha256').update(plain).digest('hex');
}

function validatePassword(plain) {
  if (plain.length < 8)              return 'Password must be at least 8 characters.';
  if (!/[A-Z]/.test(plain))         return 'Password must contain an uppercase letter.';
  if (!/[a-z]/.test(plain))         return 'Password must contain a lowercase letter.';
  if (!/[0-9]/.test(plain))         return 'Password must contain a digit.';
  if (!/[@#$%&!^*()\-_=+[\]{}|;:,.<>?/~`]/.test(plain))
    return 'Password must contain a special character.';
  return null;
}


function requireFields(values) {
  for (const [label, value] of values) {
    if (value === undefined || value === null || String(value).trim() === '') {
      return `${label} is required.`;
    }
  }
  return null;
}

router.get('/',          guard, (req, res) => res.render('db_manager/dashboard'));

router.get('/stadiums',  guard, async (req, res) => {
  const stadiums = await q.getStadiums();
  res.render('db_manager/stadiums', { stadiums });
});

router.get('/rename-stadium', guard, async (req, res) => {
  const stadiums = await q.getStadiumList();
  res.render('db_manager/rename_stadium', { stadiums });
});
router.post('/rename-stadium', guard, async (req, res) => {
  try {
    await q.renameStadium(req.body.stadium_id, req.body.new_name.trim());
    req.session.flash = 'Stadium renamed successfully.';
    res.redirect('/db-manager/stadiums');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect('/db-manager/rename-stadium');
  }
});

router.get('/schedule-match', guard, async (req, res) => {
  const [clubs, stadiums, referees, competitions] = await Promise.all([
    q.getClubs(), q.getStadiumsWithCity(), q.getReferees(), q.getCompetitions(),
  ]);
  res.render('db_manager/schedule_match', { clubs, stadiums, referees, competitions });
});
router.post('/schedule-match', guard, async (req, res) => {
  try {
    await q.scheduleMatch({
      matchDate:     req.body.match_date,
      matchTime:     req.body.match_time,
      stadiumId:     req.body.stadium_id,
      homeClubId:    req.body.home_club_id,
      awayClubId:    req.body.away_club_id,
      refereeId:     req.body.referee_id,
      competitionId: req.body.competition_id,
    });
    req.session.flash = 'Match scheduled successfully.';
    res.redirect('/db-manager');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect('/db-manager/schedule-match');
  }
});

router.get('/create-competition', guard, (req, res) =>
  res.render('db_manager/create_competition'));
router.post('/create-competition', guard, async (req, res) => {
  try {
    await q.createCompetition({
      name:            req.body.name.trim(),
      season:          req.body.season.trim(),
      country:         req.body.country.trim(),
      competitionType: req.body.competition_type,
    });
    req.session.flash = 'Competition created successfully.';
    res.redirect('/db-manager');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect('/db-manager/create-competition');
  }
});

router.get('/assign-manager', guard, async (req, res) => {
  const [managers, clubs, current] = await Promise.all([
    q.getManagers(), q.getClubs(), q.getCurrentAssignments(),
  ]);
  res.render('db_manager/assign_manager', { managers, clubs, current });
});
router.post('/assign-manager', guard, async (req, res) => {
  try {
    if (req.body.action === 'close') {
      await q.removeManagerAssignment(req.body.manager_id);
      req.session.flash = 'Assignment closed.';
    } else {
      await q.assignManager({
        managerId: req.body.manager_id,
        clubId:    req.body.club_id,
        startDate: req.body.start_date,
      });
      req.session.flash = 'Manager assigned successfully.';
    }
    res.redirect('/db-manager/assign-manager');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect('/db-manager/assign-manager');
  }
});

router.get('/register-transfer', guard, async (req, res) => {
  const [players, clubs] = await Promise.all([q.getPlayers(), q.getClubs()]);
  res.render('db_manager/register_transfer', { players, clubs });
});
router.post('/register-transfer', guard, async (req, res) => {
  const today = new Date().toISOString().split('T')[0];
  if (req.body.end_date <= today) {
    req.session.flash = 'Contract end date must be in the future (transfer date is always set to today).';
    return res.redirect('/db-manager/register-transfer');
  }

  try {
    await q.registerTransfer({
      playerId:      req.body.player_id,
      fromClubId:    req.body.from_club_id || null,
      toClubId:      req.body.to_club_id,
      transferType:  req.body.transfer_type,
      transferFee:   req.body.transfer_fee,
      contractType:  req.body.contract_type,
      weeklyWage:    req.body.weekly_wage,
      endDate:       req.body.end_date,
    });
    req.session.flash = 'Transfer and contract registered successfully.';
    res.redirect('/db-manager');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect('/db-manager/register-transfer');
  }
});

router.get('/create-user', guard, (req, res) =>
  res.render('db_manager/create_user', { body: {}, selectedRole: 'player' }));

router.post('/create-user', guard, async (req, res) => {
  const selectedRole = req.body.role || 'player';
  const body = req.body;

  const passwordError = validatePassword(req.body.password || '');
  if (passwordError) {
    req.session.flash = passwordError;
    return res.render('db_manager/create_user', { body, selectedRole });
  }

  try {
    const passwordHash = hashPassword(req.body.password);

    if (selectedRole === 'db_manager') {
      const fieldError = requireFields([
        ['Username', req.body.username],
      ]);
      if (fieldError) throw new Error(fieldError);

      await q.createDatabaseManager({
        username: req.body.username.trim(),
        passwordHash,
      });
    } else if (selectedRole === 'player') {
      const fieldError = requireFields([
        ['Username', req.body.username],
        ['Name', req.body.name],
        ['Surname', req.body.surname],
        ['Nationality', req.body.nationality],
        ['Date of Birth', req.body.date_of_birth],
        ['Market Value', req.body.market_value],
        ['Main Position', req.body.main_position],
        ['Strong Foot', req.body.strong_foot],
        ['Height', req.body.height_cm],
      ]);
      if (fieldError) throw new Error(fieldError);

      await q.createPlayer({
        username: req.body.username.trim(),
        passwordHash,
        name: req.body.name.trim(),
        surname: req.body.surname.trim(),
        nationality: req.body.nationality.trim(),
        dateOfBirth: req.body.date_of_birth,
        marketValue: req.body.market_value,
        mainPosition: req.body.main_position,
        strongFoot: req.body.strong_foot,
        heightCm: req.body.height_cm,
      });
    } else if (selectedRole === 'manager') {
      const fieldError = requireFields([
        ['Username', req.body.username],
        ['Name', req.body.name],
        ['Surname', req.body.surname],
        ['Nationality', req.body.nationality],
        ['Date of Birth', req.body.date_of_birth],
        ['Preferred Formation', req.body.preferred_formation],
        ['Experience Level', req.body.experience_level],
      ]);
      if (fieldError) throw new Error(fieldError);

      await q.createManager({
        username: req.body.username.trim(),
        passwordHash,
        name: req.body.name.trim(),
        surname: req.body.surname.trim(),
        nationality: req.body.nationality.trim(),
        dateOfBirth: req.body.date_of_birth,
        preferredFormation: req.body.preferred_formation.trim(),
        experienceLevel: req.body.experience_level,
      });
    } else if (selectedRole === 'referee') {
      const fieldError = requireFields([
        ['Username', req.body.username],
        ['Name', req.body.name],
        ['Surname', req.body.surname],
        ['Nationality', req.body.nationality],
        ['Date of Birth', req.body.date_of_birth],
        ['License Level', req.body.license_level],
        ['Years of Experience', req.body.years_experience],
      ]);
      if (fieldError) throw new Error(fieldError);

      await q.createReferee({
        username: req.body.username.trim(),
        passwordHash,
        name: req.body.name.trim(),
        surname: req.body.surname.trim(),
        nationality: req.body.nationality.trim(),
        dateOfBirth: req.body.date_of_birth,
        licenseLevel: req.body.license_level.trim(),
        yearsExperience: req.body.years_experience,
      });
    } else {
      throw new Error('Unknown role.');
    }

    req.session.flash = 'User created successfully.';
    res.redirect('/db-manager/create-user');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.render('db_manager/create_user', { body, selectedRole });
  }
});

module.exports = router;
