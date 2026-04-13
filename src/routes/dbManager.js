// routes/dbManager.js — HTTP layer only; all SQL is in queries/dbManager.js
const express  = require('express');
const q        = require('../queries/dbManager');
const { requireLogin } = require('../middleware/auth');
const router   = express.Router();
const guard    = requireLogin('db_manager');

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

router.get('/create-user', guard, (req, res) => res.render('db_manager/create_user'));

module.exports = router;
