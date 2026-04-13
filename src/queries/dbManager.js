// queries/dbManager.js
// All SQL for the Database Manager role lives here.
const db = require('../db');

async function createDatabaseManager({ username, passwordHash }) {
  return db.execute(
    `INSERT INTO DatabaseManager (username, password_hash)
     VALUES (?, ?)`,
    [username, passwordHash]
  );
}

async function createPersonUser({
  username,
  passwordHash,
  name,
  surname,
  nationality,
  dateOfBirth,
}) {
  const personId = await db.nextId('Person', 'person_ID');

  await db.execute(
    `INSERT INTO Person
       (person_ID, username, password_hash, name, surname, nationality, date_of_birth)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [personId, username, passwordHash, name, surname, nationality, dateOfBirth]
  );

  return personId;
}

async function createPlayer({
  username, passwordHash, name, surname, nationality, dateOfBirth,
  marketValue, mainPosition, strongFoot, heightCm,
}) {
  const personId = await createPersonUser({
    username,
    passwordHash,
    name,
    surname,
    nationality,
    dateOfBirth,
  });

  await db.execute(
    `INSERT INTO Player (person_ID, market_value, main_position, strong_foot, height_cm)
     VALUES (?, ?, ?, ?, ?)`,
    [personId, marketValue, mainPosition, strongFoot, heightCm]
  );

  return personId;
}

async function createManager({
  username, passwordHash, name, surname, nationality, dateOfBirth,
  preferredFormation, experienceLevel,
}) {
  const personId = await createPersonUser({
    username,
    passwordHash,
    name,
    surname,
    nationality,
    dateOfBirth,
  });

  await db.execute(
    `INSERT INTO Manager (person_ID, preferred_formation, experience_level)
     VALUES (?, ?, ?)`,
    [personId, preferredFormation, experienceLevel]
  );

  return personId;
}

async function createReferee({
  username, passwordHash, name, surname, nationality, dateOfBirth,
  licenseLevel, yearsExperience,
}) {
  const personId = await createPersonUser({
    username,
    passwordHash,
    name,
    surname,
    nationality,
    dateOfBirth,
  });

  await db.execute(
    `INSERT INTO Referee (person_ID, license_level, years_experience)
     VALUES (?, ?, ?)`,
    [personId, licenseLevel, yearsExperience]
  );

  return personId;
}

// Operation 2: View stadiums
async function getStadiums() {
  return db.query(
    `SELECT s.stadium_ID, s.stadium_name, s.city, s.capacity,
            GROUP_CONCAT(c.club_name ORDER BY c.club_name SEPARATOR ', ') AS clubs
     FROM Stadium s
     LEFT JOIN Club c ON c.stadium_ID = s.stadium_ID
     GROUP BY s.stadium_ID, s.stadium_name, s.city, s.capacity
     ORDER BY s.stadium_name`
  );
}

async function getStadiumList() {
  return db.query(
    `SELECT stadium_ID, stadium_name
     FROM Stadium
     ORDER BY stadium_name`
  );
}

// Operation 10: Rename a stadium
async function renameStadium(stadiumId, newName) {
  return db.execute(
    `UPDATE Stadium
     SET stadium_name = ?
     WHERE stadium_ID = ?`,
    [newName, stadiumId]
  );
}

// Operation 3: Schedule a match
async function getClubs() {
  return db.query(
    `SELECT club_ID, club_name
     FROM Club
     ORDER BY club_name`
  );
}

async function getStadiumsWithCity() {
  return db.query(
    `SELECT stadium_ID, stadium_name, city
     FROM Stadium
     ORDER BY stadium_name`
  );
}

async function getReferees() {
  return db.query(
    `SELECT r.person_ID, p.name, p.surname
     FROM Referee r
     INNER JOIN Person p ON p.person_ID = r.person_ID
     ORDER BY p.surname, p.name`
  );
}

async function getCompetitions() {
  return db.query(
    `SELECT competition_ID, name, season, competition_type
     FROM Competition
     ORDER BY season DESC, name`
  );
}

async function scheduleMatch({ matchDate, matchTime, stadiumId, homeClubId, awayClubId, refereeId, competitionId }) {
  const matchId = await db.nextId('Match', 'match_ID');

  const result = await db.execute(
    `INSERT INTO \`Match\`
       (match_ID, match_date, match_time, stadium_ID, home_club_ID, away_club_ID, referee_ID, competition_ID)
     VALUES (?,?,?,?,?,?,?,?)`,
    [matchId, matchDate, matchTime, stadiumId, homeClubId, awayClubId, refereeId, competitionId]
  );

  await db.execute(
    `INSERT IGNORE INTO Club_Competition_Participation (club_ID, competition_ID)
     VALUES (?, ?), (?, ?)`,
    [homeClubId, competitionId, awayClubId, competitionId]
  );

  return result;
}

// Operation 12: Create competition
async function createCompetition({ name, season, country, competitionType }) {
  const competitionId = await db.nextId('Competition', 'competition_ID');
  return db.execute(
    `INSERT INTO Competition
       (competition_ID, name, season, country, competition_type)
     VALUES (?,?,?,?,?)`,
    [competitionId, name, season, country, competitionType]
  );
}

// Operation 11: Manage manager-club assignments
async function getManagers() {
  return db.query(
    `SELECT m.person_ID, p.name, p.surname
     FROM Manager m
     INNER JOIN Person p ON p.person_ID = m.person_ID
     ORDER BY p.surname, p.name`
  );
}

async function getCurrentAssignments() {
  return db.query(
    `SELECT l.manager_ID, l.club_ID, l.start_date,
            p.name, p.surname, c.club_name
     FROM Leads l
     INNER JOIN Person p ON p.person_ID = l.manager_ID
     INNER JOIN Club c ON c.club_ID = l.club_ID
     WHERE l.end_date IS NULL
     ORDER BY c.club_name`
  );
}

async function assignManager({ managerId, clubId, startDate }) {
  return db.execute(
    `INSERT INTO Leads (club_ID, manager_ID, start_date, end_date)
     VALUES (?, ?, ?, NULL)`,
    [clubId, managerId, startDate]
  );
}

async function removeManagerAssignment(managerId) {
  return db.execute(
    `UPDATE Leads
     SET end_date = CASE
       WHEN start_date >= CURDATE() THEN DATE_ADD(start_date, INTERVAL 1 DAY)
       ELSE CURDATE()
     END
     WHERE manager_ID = ? AND end_date IS NULL`,
    [managerId]
  );
}

// Operation 9: Register transfer & contract
async function getPlayers() {
  return db.query(
    `SELECT pl.person_ID, p.name, p.surname
     FROM Player pl
     INNER JOIN Person p ON p.person_ID = pl.person_ID
     ORDER BY p.surname, p.name`
  );
}

async function registerTransfer({ playerId, fromClubId, toClubId, transferType, transferFee, contractType, weeklyWage, endDate }) {
  const transferId = await db.nextId('TransferRecord', 'transfer_id');
  const contractId = await db.nextId('Contract', 'contract_id');

  if (contractType === 'Permanent') {
    await db.execute(
      `UPDATE Contract
       SET end_date = CURDATE()
       WHERE player_id = ?
         AND contract_type = 'Permanent'
         AND end_date > CURDATE()`,
      [playerId]
    );
  }

  await db.execute(
    `INSERT INTO TransferRecord
       (transfer_id, player_id, from_club_id, to_club_id, transfer_date, transfer_fee, transfer_type)
     VALUES (?,?,?,?,CURDATE(),?,?)`,
    [transferId, playerId, fromClubId, toClubId, transferFee, transferType]
  );

  await db.execute(
    `INSERT INTO Contract
       (contract_id, player_id, club_id, start_date, end_date, weekly_wage, contract_type)
     VALUES (?,?,?,CURDATE(),?,?,?)`,
    [contractId, playerId, toClubId, endDate, weeklyWage, contractType]
  );

  if (contractType === 'Permanent') {
    await db.execute(
      `INSERT INTO PermanentContract (contract_id)
       VALUES (?)`,
      [contractId]
    );
  } else {
    const parentContract = await db.queryOne(
      `SELECT pc.contract_id
       FROM PermanentContract pc
       INNER JOIN Contract c ON c.contract_id = pc.contract_id
       WHERE c.player_id = ?
         AND c.club_id <> ?
         AND c.end_date > CURDATE()
       ORDER BY c.start_date DESC
       LIMIT 1`,
      [playerId, toClubId]
    );

    if (!parentContract) {
      throw new Error('Loan contract requires an active permanent parent club.');
    }

    await db.execute(
      `INSERT INTO LoanContract (contract_id, parent_permanent_contract_id)
       VALUES (?, ?)`,
      [contractId, parentContract.contract_id]
    );
  }

  if (transferType === 'Purchase') {
    await db.execute(
      `UPDATE Player
       SET market_value = ?
       WHERE person_ID = ?`,
      [transferFee, playerId]
    );
  }
}

module.exports = {
  createDatabaseManager,
  createPlayer,
  createManager,
  createReferee,
  getStadiums,
  getStadiumList,
  renameStadium,
  getClubs,
  getStadiumsWithCity,
  getReferees,
  getCompetitions,
  scheduleMatch,
  createCompetition,
  getManagers,
  getCurrentAssignments,
  assignManager,
  removeManagerAssignment,
  getPlayers,
  registerTransfer,
};
