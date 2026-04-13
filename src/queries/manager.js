// queries/manager.js
// All SQL for the Manager role lives here.
const db = require('../db');

async function getManagerProfile(managerId) {
  return db.queryOne(
    `SELECT p.name, p.surname, p.nationality, p.date_of_birth,
            TIMESTAMPDIFF(YEAR, p.date_of_birth, CURDATE()) AS age,
            m.preferred_formation, m.experience_level
     FROM Person p INNER JOIN Manager m ON m.person_ID = p.person_ID
     WHERE p.person_ID = ?`,
    [managerId]
  );
}

async function getManagerClub(managerId) {
  return db.queryOne(
    `SELECT c.club_ID, c.club_name
     FROM Leads l INNER JOIN Club c ON c.club_ID = l.club_ID
     WHERE l.manager_ID = ? AND l.end_date IS NULL`,
    [managerId]
  );
}

async function getClubCompetitions(clubId) {
  return db.query(
    `SELECT DISTINCT comp.competition_ID, comp.name, comp.season
     FROM Competition comp
     INNER JOIN Club_Competition_Participation ccp ON ccp.competition_ID = comp.competition_ID
     WHERE ccp.club_ID = ? ORDER BY comp.season DESC, comp.name`,
    [clubId]
  );
}

async function getClubSeasons(clubId) {
  return db.query(
    `SELECT DISTINCT comp.season
     FROM Competition comp
     INNER JOIN Club_Competition_Participation ccp ON ccp.competition_ID = comp.competition_ID
     WHERE ccp.club_ID = ? ORDER BY comp.season DESC`,
    [clubId]
  );
}

// Operation 4: Fixtures & Results
async function getFixtures(clubId, { competitionId, season } = {}) {
  let sql = `
    SELECT m.match_ID, m.match_date, m.match_time, m.is_played,
           m.home_goals, m.away_goals, m.home_club_ID, m.away_club_ID,
           hc.club_name AS home_club, ac.club_name AS away_club,
           comp.name AS competition, comp.season, s.stadium_name
    FROM \`Match\` m
    INNER JOIN Club hc          ON hc.club_ID          = m.home_club_ID
    INNER JOIN Club ac          ON ac.club_ID          = m.away_club_ID
    INNER JOIN Stadium s        ON s.stadium_ID        = m.stadium_ID
    INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
    WHERE (m.home_club_ID = ? OR m.away_club_ID = ?)`;
  const params = [clubId, clubId];

  if (competitionId) { sql += ' AND m.competition_ID = ?'; params.push(competitionId); }
  if (season)        { sql += ' AND comp.season = ?';      params.push(season); }
  sql += ' ORDER BY m.match_date DESC, m.match_time DESC';
  return db.query(sql, params);
}

// Operation 5: Eligible players for a match squad
async function getEligiblePlayers(clubId) {
  return db.query(
    `SELECT DISTINCT p.person_ID, p.name, p.surname, pl.main_position
     FROM Person p
     INNER JOIN Player pl ON pl.person_ID = p.person_ID
     INNER JOIN Contract c ON c.player_id = p.person_ID
     WHERE c.club_id = ? AND c.end_date > CURDATE()
       AND p.person_ID NOT IN (
         SELECT c2.player_id FROM Contract c2
         INNER JOIN LoanContract lc ON lc.contract_id = c2.contract_id
         WHERE c2.end_date > CURDATE() AND c2.club_id <> ?
       )
     ORDER BY p.surname`,
    [clubId, clubId]
  );
}

async function getMatchSquad(matchId, clubId) {
  return db.query(
    'SELECT player_id FROM Match_Participation WHERE match_ID = ? AND club_id = ?',
    [matchId, clubId]
  );
}

async function getMatchForClub(matchId, clubId) {
  return db.queryOne(
    `SELECT m.*, hc.club_name AS home_club, ac.club_name AS away_club
     FROM \`Match\` m
     INNER JOIN Club hc ON hc.club_ID = m.home_club_ID
     INNER JOIN Club ac ON ac.club_ID = m.away_club_ID
     WHERE m.match_ID = ? AND (m.home_club_ID = ? OR m.away_club_ID = ?)`,
    [matchId, clubId, clubId]
  );
}

async function submitSquad(matchId, clubId, playerIds, starterIds) {
  await db.execute(
    'DELETE FROM Match_Participation WHERE match_ID = ? AND club_id = ?',
    [matchId, clubId]
  );
  for (const pid of playerIds) {
    await db.execute(
      `INSERT INTO Match_Participation
         (match_ID, player_id, club_id, is_starter, minutes_played, position_in_match)
       VALUES (?,?,?,?,0,'')`,
      [matchId, pid, clubId, starterIds.has(pid) ? 1 : 0]
    );
  }
}

// Operation 6: League Standings
async function getStandings(competitionId) {
  return db.query(
    `SELECT
       c.club_name,
       COUNT(m.match_ID) AS played,
       SUM(CASE
         WHEN (m.home_club_ID = c.club_ID AND m.home_goals > m.away_goals)
           OR (m.away_club_ID = c.club_ID AND m.away_goals > m.home_goals)
         THEN 1 ELSE 0 END) AS wins,
       SUM(CASE WHEN m.home_goals = m.away_goals THEN 1 ELSE 0 END) AS draws,
       SUM(CASE
         WHEN (m.home_club_ID = c.club_ID AND m.home_goals < m.away_goals)
           OR (m.away_club_ID = c.club_ID AND m.away_goals < m.home_goals)
         THEN 1 ELSE 0 END) AS losses,
       SUM(CASE WHEN m.home_club_ID = c.club_ID THEN m.home_goals ELSE m.away_goals END) AS goals_for,
       SUM(CASE WHEN m.home_club_ID = c.club_ID THEN m.away_goals ELSE m.home_goals END) AS goals_against,
       SUM(CASE WHEN m.home_club_ID = c.club_ID THEN m.home_goals - m.away_goals
                ELSE m.away_goals - m.home_goals END) AS goal_diff,
       SUM(CASE
         WHEN (m.home_club_ID = c.club_ID AND m.home_goals > m.away_goals)
           OR (m.away_club_ID = c.club_ID AND m.away_goals > m.home_goals) THEN 3
         WHEN m.home_goals = m.away_goals THEN 1
         ELSE 0 END) AS points
     FROM Club c
     INNER JOIN Club_Competition_Participation ccp
       ON ccp.club_ID = c.club_ID AND ccp.competition_ID = ?
     INNER JOIN \`Match\` m
       ON m.competition_ID = ? AND m.is_played = TRUE
       AND (m.home_club_ID = c.club_ID OR m.away_club_ID = c.club_ID)
     GROUP BY c.club_ID, c.club_name
     ORDER BY points DESC, goal_diff DESC`,
    [competitionId, competitionId]
  );
}

async function getLeagueCompetitions(clubId) {
  return db.query(
    `SELECT DISTINCT comp.competition_ID, comp.name, comp.season
     FROM Competition comp
     INNER JOIN Club_Competition_Participation ccp ON ccp.competition_ID = comp.competition_ID
     WHERE ccp.club_ID = ? AND comp.competition_type = 'League'
     ORDER BY comp.season DESC, comp.name`,
    [clubId]
  );
}

// Operation 7: Squad Statistics
// Current: active-roster players with all-time totals ONLY for matches played for this club.
// Historical: players who represented the club in the given season (and optional competition).
// Both filter on m.is_played = TRUE so future squad rows never inflate totals.
async function getSquadStatsCurrent(clubId) {
  return db.query(
    `SELECT pe.name, pe.surname,
            TIMESTAMPDIFF(YEAR, pe.date_of_birth, CURDATE()) AS age,
            pl.main_position, pl.strong_foot, pl.height_cm, pl.market_value, pe.nationality,
            COUNT(m.match_ID)                AS matches_played,
            COALESCE(SUM(mp.goals), 0)       AS goals,
            COALESCE(SUM(mp.assists), 0)     AS assists,
            COALESCE(SUM(mp.yellow_cards),0) AS yellow_cards,
            COALESCE(SUM(mp.red_cards), 0)   AS red_cards,
            ROUND(AVG(mp.rating), 2)         AS avg_rating,
            ROUND(AVG(mp.minutes_played), 1) AS avg_minutes
     FROM Person pe
     INNER JOIN Player pl ON pl.person_ID = pe.person_ID
     INNER JOIN Contract c ON c.player_id = pe.person_ID
       AND c.club_id = ? AND c.end_date > CURDATE()
     LEFT JOIN Match_Participation mp
       ON mp.player_id = pe.person_ID AND mp.club_id = ?
     LEFT JOIN \`Match\` m
       ON m.match_ID = mp.match_ID AND m.is_played = TRUE
     GROUP BY pe.person_ID ORDER BY pe.surname`,
    [clubId, clubId]
  );
}

async function getSquadStatsHistorical(clubId, season, competitionId) {
  let sql = `
    SELECT pe.name, pe.surname,
           TIMESTAMPDIFF(YEAR, pe.date_of_birth, CURDATE()) AS age,
           pl.main_position, pl.strong_foot, pl.height_cm, pl.market_value, pe.nationality,
           COUNT(m.match_ID)                AS matches_played,
           COALESCE(SUM(mp.goals), 0)       AS goals,
           COALESCE(SUM(mp.assists), 0)     AS assists,
           COALESCE(SUM(mp.yellow_cards),0) AS yellow_cards,
           COALESCE(SUM(mp.red_cards), 0)   AS red_cards,
           ROUND(AVG(mp.rating), 2)         AS avg_rating,
           ROUND(AVG(mp.minutes_played), 1) AS avg_minutes
    FROM Person pe
    INNER JOIN Player pl ON pl.person_ID = pe.person_ID
    INNER JOIN Match_Participation mp ON mp.player_id = pe.person_ID AND mp.club_id = ?
    INNER JOIN \`Match\` m ON m.match_ID = mp.match_ID AND m.is_played = TRUE
    INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
    WHERE comp.season = ?`;
  const params = [clubId, season];
  if (competitionId) {
    sql += ' AND comp.competition_ID = ?';
    params.push(competitionId);
  }
  sql += ' GROUP BY pe.person_ID ORDER BY pe.surname';
  return db.query(sql, params);
}

// Operation 8: Competition Leaderboards
async function getTopScorers(competitionId) {
  return db.query(
    `SELECT pe.name, pe.surname, cl.club_name,
            COUNT(mp.match_ID) AS matches_played, SUM(mp.goals) AS metric
     FROM Person pe
     INNER JOIN Player pl  ON pl.person_ID  = pe.person_ID
     INNER JOIN Match_Participation mp ON mp.player_id = pe.person_ID
     INNER JOIN \`Match\` m    ON m.match_ID    = mp.match_ID AND m.is_played = TRUE
     INNER JOIN Club cl    ON cl.club_ID    = mp.club_id
     WHERE m.competition_ID = ?
     GROUP BY pe.person_ID, cl.club_ID ORDER BY metric DESC LIMIT 10`,
    [competitionId]
  );
}

async function getTopAssists(competitionId) {
  return db.query(
    `SELECT pe.name, pe.surname, cl.club_name,
            COUNT(mp.match_ID) AS matches_played, SUM(mp.assists) AS metric
     FROM Person pe
     INNER JOIN Player pl  ON pl.person_ID  = pe.person_ID
     INNER JOIN Match_Participation mp ON mp.player_id = pe.person_ID
     INNER JOIN \`Match\` m    ON m.match_ID    = mp.match_ID AND m.is_played = TRUE
     INNER JOIN Club cl    ON cl.club_ID    = mp.club_id
     WHERE m.competition_ID = ?
     GROUP BY pe.person_ID, cl.club_ID ORDER BY metric DESC LIMIT 10`,
    [competitionId]
  );
}

async function getTopRatings(competitionId) {
  return db.query(
    `SELECT pe.name, pe.surname, cl.club_name,
            COUNT(mp.match_ID) AS matches_played, ROUND(AVG(mp.rating), 2) AS metric
     FROM Person pe
     INNER JOIN Player pl  ON pl.person_ID  = pe.person_ID
     INNER JOIN Match_Participation mp ON mp.player_id = pe.person_ID
     INNER JOIN \`Match\` m    ON m.match_ID    = mp.match_ID AND m.is_played = TRUE
     INNER JOIN Club cl    ON cl.club_ID    = mp.club_id
     WHERE m.competition_ID = ?
     GROUP BY pe.person_ID, cl.club_ID
     HAVING COUNT(mp.match_ID) >= 3
     ORDER BY metric DESC LIMIT 10`,
    [competitionId]
  );
}

module.exports = {
  getManagerProfile,
  getManagerClub,
  getClubCompetitions,
  getClubSeasons,
  getLeagueCompetitions,
  getFixtures,
  getEligiblePlayers,
  getMatchSquad,
  getMatchForClub,
  submitSquad,
  getStandings,
  getSquadStatsCurrent,
  getSquadStatsHistorical,
  getTopScorers,
  getTopAssists,
  getTopRatings,
};
