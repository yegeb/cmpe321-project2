// queries/referee.js
// All SQL for the Referee role lives here.
const db = require('../db');

// Operation 1: Referee profile
async function getRefereeProfile(refereeId) {
  return db.queryOne(
    `SELECT p.name, p.surname, p.nationality, p.date_of_birth,
            TIMESTAMPDIFF(YEAR, p.date_of_birth, CURDATE()) AS age,
            r.license_level, r.years_experience
     FROM Person p
     INNER JOIN Referee r ON r.person_ID = p.person_ID
     WHERE p.person_ID = ?`,
    [refereeId]
  );
}

// Operation 14: Career statistics
async function getCareerStats(refereeId) {
  return db.queryOne(
    `SELECT COUNT(DISTINCT m.match_ID) AS matches_officiated,
            COALESCE(SUM(cards.yellow_cards), 0) AS total_yellow,
            COALESCE(SUM(cards.red_cards), 0) AS total_red
     FROM \`Match\` m
     LEFT JOIN (
       SELECT mp.match_ID,
              SUM(mp.yellow_cards) AS yellow_cards,
              SUM(mp.red_cards) AS red_cards
       FROM Match_Participation mp
       GROUP BY mp.match_ID
     ) cards ON cards.match_ID = m.match_ID
     WHERE m.referee_ID = ? AND m.is_played = TRUE`,
    [refereeId]
  );
}

// Operation 15: Match history
async function getMatchHistory(refereeId) {
  return db.query(
    `SELECT m.match_ID, m.match_date, m.match_time, m.is_played, m.attendance,
            m.home_goals, m.away_goals,
            comp.name AS competition, s.stadium_name,
            hc.club_name AS home_club, ac.club_name AS away_club,
            COALESCE(SUM(CASE WHEN m.is_played THEN mp.yellow_cards ELSE 0 END), 0) AS match_yellows,
            COALESCE(SUM(CASE WHEN m.is_played THEN mp.red_cards ELSE 0 END), 0) AS match_reds
     FROM \`Match\` m
     INNER JOIN Competition comp ON comp.competition_ID = m.competition_ID
     INNER JOIN Stadium s ON s.stadium_ID = m.stadium_ID
     INNER JOIN Club hc ON hc.club_ID = m.home_club_ID
     INNER JOIN Club ac ON ac.club_ID = m.away_club_ID
     LEFT JOIN Match_Participation mp ON mp.match_ID = m.match_ID
     WHERE m.referee_ID = ?
     GROUP BY m.match_ID, m.match_date, m.match_time, m.is_played, m.attendance,
              m.home_goals, m.away_goals, comp.name, s.stadium_name, hc.club_name, ac.club_name
     ORDER BY m.match_date DESC, m.match_time DESC`,
    [refereeId]
  );
}

// Operation 13: Submit match result
async function getMatchForReferee(matchId, refereeId) {
  return db.queryOne(
    `SELECT m.match_ID, m.match_date, m.match_time, m.is_played,
            m.home_goals, m.away_goals, m.attendance,
            m.home_club_ID, m.away_club_ID,
            hc.club_name AS home_club, ac.club_name AS away_club,
            s.capacity AS stadium_capacity
     FROM \`Match\` m
     INNER JOIN Club hc ON hc.club_ID = m.home_club_ID
     INNER JOIN Club ac ON ac.club_ID = m.away_club_ID
     INNER JOIN Stadium s ON s.stadium_ID = m.stadium_ID
     WHERE m.match_ID = ? AND m.referee_ID = ?`,
    [matchId, refereeId]
  );
}

async function getMatchParticipants(matchId) {
  return db.query(
    `SELECT mp.match_ID, mp.player_id, mp.club_id, mp.position_in_match, mp.minutes_played,
            mp.goals, mp.assists, mp.yellow_cards, mp.red_cards, mp.rating,
            p.name, p.surname, c.club_name
     FROM Match_Participation mp
     INNER JOIN Person p ON p.person_ID = mp.player_id
     INNER JOIN Club c ON c.club_ID = mp.club_id
     WHERE mp.match_ID = ?
     ORDER BY c.club_name, mp.is_starter DESC, p.surname, p.name`,
    [matchId]
  );
}

async function submitResult({ matchId, homeGoals, awayGoals, attendance, playerStats }) {
  return db.withTransaction(async (tx) => {
    const currentMatch = await tx.queryOne(
      `SELECT is_played FROM \`Match\` WHERE match_ID = ?`,
      [matchId]
    );

    if (!currentMatch) {
      throw new Error('Match not found.');
    }
    if (currentMatch.is_played) {
      throw new Error('Result has already been submitted for this match.');
    }

    await tx.execute(
      `UPDATE \`Match\` SET home_goals = ?, away_goals = ?, attendance = ? WHERE match_ID = ?`,
      [homeGoals, awayGoals, attendance, matchId]
    );

    for (const stat of playerStats) {
      await tx.execute(
        `UPDATE Match_Participation
         SET goals = ?, assists = ?, yellow_cards = ?, red_cards = ?,
             minutes_played = ?, position_in_match = ?, rating = ?
         WHERE match_ID = ? AND player_id = ?`,
        [
          stat.goals,
          stat.assists,
          stat.yellowCards,
          stat.redCards,
          stat.minutesPlayed,
          stat.position,
          stat.rating || null,
          matchId,
          stat.playerId,
        ]
      );
    }

    await tx.execute(
      `UPDATE \`Match\` SET is_played = TRUE WHERE match_ID = ?`,
      [matchId]
    );
  });
}

module.exports = {
  getRefereeProfile,
  getCareerStats,
  getMatchHistory,
  getMatchForReferee,
  getMatchParticipants,
  submitResult,
};
