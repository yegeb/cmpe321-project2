// queries/player.js
// All SQL for the Player role lives here.
const db = require('../db');

// Operation 1: Player profile
// Current club = loan club if on active Loan, otherwise active Permanent club.
async function getPlayerProfile(playerId) {
  return db.queryOne(
    `SELECT pe.name, pe.surname, pe.nationality, pe.date_of_birth,
            TIMESTAMPDIFF(YEAR, pe.date_of_birth, CURDATE()) AS age,
            pl.market_value, pl.main_position, pl.strong_foot, pl.height_cm,
            (
              SELECT c.club_name
              FROM Contract ct
              INNER JOIN Club c ON c.club_ID = ct.club_id
              WHERE ct.player_id = pe.person_ID
                AND ct.end_date > CURDATE()
              ORDER BY (ct.contract_type = 'Loan') DESC, ct.start_date DESC
              LIMIT 1
            ) AS current_club
     FROM Person pe
     INNER JOIN Player pl ON pl.person_ID = pe.person_ID
     WHERE pe.person_ID = ?
     LIMIT 1`,
    [playerId]
  );
}

// Operation 16: Performance statistics (career / season / competition+season)
// All stat queries count only matches that have actually been played
// (is_played = TRUE) — squad rows for future matches must not inflate totals.
async function getCareerStats(playerId) {
  return db.queryOne(
    `SELECT COUNT(mp.match_ID)      AS games_played,
            COALESCE(SUM(mp.goals), 0)        AS goals,
            COALESCE(SUM(mp.assists), 0)      AS assists,
            COALESCE(SUM(mp.yellow_cards), 0) AS yellow_cards,
            COALESCE(SUM(mp.red_cards), 0)    AS red_cards,
            ROUND(AVG(mp.rating), 2)          AS avg_rating
     FROM Match_Participation mp
     INNER JOIN \`Match\` m ON m.match_ID = mp.match_ID
     WHERE mp.player_id = ? AND m.is_played = TRUE`,
    [playerId]
  );
}

async function getSeasonStats(playerId, season) {
  return db.queryOne(
    `SELECT COUNT(mp.match_ID)      AS games_played,
            COALESCE(SUM(mp.goals), 0)        AS goals,
            COALESCE(SUM(mp.assists), 0)      AS assists,
            COALESCE(SUM(mp.yellow_cards), 0) AS yellow_cards,
            COALESCE(SUM(mp.red_cards), 0)    AS red_cards,
            ROUND(AVG(mp.rating), 2)          AS avg_rating
     FROM Match_Participation mp
     INNER JOIN \`Match\` m ON m.match_ID = mp.match_ID
     INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
     WHERE mp.player_id = ? AND comp.season = ? AND m.is_played = TRUE`,
    [playerId, season]
  );
}

async function getCompetitionSeasonStats(playerId, competitionId, season) {
  return db.queryOne(
    `SELECT COUNT(mp.match_ID)      AS games_played,
            COALESCE(SUM(mp.goals), 0)        AS goals,
            COALESCE(SUM(mp.assists), 0)      AS assists,
            COALESCE(SUM(mp.yellow_cards), 0) AS yellow_cards,
            COALESCE(SUM(mp.red_cards), 0)    AS red_cards,
            ROUND(AVG(mp.rating), 2)          AS avg_rating
     FROM Match_Participation mp
     INNER JOIN \`Match\` m ON m.match_ID = mp.match_ID
     INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
     WHERE mp.player_id = ? AND comp.competition_ID = ? AND comp.season = ?
       AND m.is_played = TRUE`,
    [playerId, competitionId, season]
  );
}

async function getPlayerCompetitions(playerId) {
  return db.query(
    `SELECT DISTINCT comp.competition_ID, comp.name, comp.season
     FROM Competition comp
     INNER JOIN \`Match\` m ON m.competition_ID = comp.competition_ID
     INNER JOIN Match_Participation mp ON mp.match_ID = m.match_ID
     WHERE mp.player_id = ? ORDER BY comp.season DESC, comp.name`,
    [playerId]
  );
}

async function getPlayerSeasons(playerId) {
  return db.query(
    `SELECT DISTINCT comp.season
     FROM Competition comp
     INNER JOIN \`Match\` m ON m.competition_ID = comp.competition_ID
     INNER JOIN Match_Participation mp ON mp.match_ID = m.match_ID
     WHERE mp.player_id = ? ORDER BY comp.season DESC`,
    [playerId]
  );
}

// Operation 17: Match history
async function getMatchHistory(playerId) {
  return db.query(
    `SELECT m.match_date, m.match_time, m.is_played,
            comp.name AS competition, s.stadium_name,
            CASE WHEN mp.club_id = m.home_club_ID THEN ac.club_name
                 ELSE hc.club_name END AS opponent,
            m.home_goals, m.away_goals, mp.club_id, m.home_club_ID,
            mp.minutes_played, mp.position_in_match,
            mp.goals, mp.assists, mp.yellow_cards, mp.red_cards, mp.rating
     FROM Match_Participation mp
     INNER JOIN \`Match\` m          ON m.match_ID          = mp.match_ID
     INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
     INNER JOIN Stadium s        ON s.stadium_ID        = m.stadium_ID
     INNER JOIN Club hc          ON hc.club_ID          = m.home_club_ID
     INNER JOIN Club ac          ON ac.club_ID          = m.away_club_ID
     WHERE mp.player_id = ?
     ORDER BY m.match_date DESC, m.match_time DESC`,
    [playerId]
  );
}

// Operation 18: Career history (contracts + transfers)
async function getContractHistory(playerId) {
  return db.query(
    `SELECT c.club_name, ct.weekly_wage, ct.contract_type, ct.start_date, ct.end_date
     FROM Contract ct INNER JOIN Club c ON c.club_ID = ct.club_id
     WHERE ct.player_id = ? ORDER BY ct.start_date DESC`,
    [playerId]
  );
}

async function getTransferHistory(playerId) {
  return db.query(
    `SELECT tr.transfer_date, tr.transfer_fee, tr.transfer_type,
            fc.club_name AS from_club, tc.club_name AS to_club
     FROM TransferRecord tr
     LEFT JOIN Club fc  ON fc.club_ID = tr.from_club_id
     INNER JOIN Club tc ON tc.club_ID = tr.to_club_id
     WHERE tr.player_id = ? ORDER BY tr.transfer_date DESC`,
    [playerId]
  );
}

module.exports = {
  getPlayerProfile,
  getCareerStats,
  getSeasonStats,
  getCompetitionSeasonStats,
  getPlayerCompetitions,
  getPlayerSeasons,
  getMatchHistory,
  getContractHistory,
  getTransferHistory,
};
