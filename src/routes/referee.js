// routes/referee.js — HTTP layer only; all SQL is in queries/referee.js
const express  = require('express');
const q        = require('../queries/referee');
const { requireLogin } = require('../middleware/auth');
const router   = express.Router();
const guard    = requireLogin('referee');

router.get('/', guard, async (req, res) => {
  const referee = await q.getRefereeProfile(req.session.user.id);
  res.render('referee/dashboard', { referee });
});

router.get('/career-stats', guard, async (req, res) => {
  const stats = await q.getCareerStats(req.session.user.id);
  res.render('referee/career_stats', { stats });
});

router.get('/match-history', guard, async (req, res) => {
  const matches = await q.getMatchHistory(req.session.user.id);
  res.render('referee/match_history', { matches });
});

router.get('/submit-result/:matchId', guard, async (req, res) => {
  const match = await q.getMatchForReferee(req.params.matchId, req.session.user.id);
  if (!match) {
    req.session.flash = 'Match not found or you are not the assigned referee.';
    return res.redirect('/referee/match-history');
  }
  const dateStr = typeof match.match_date === 'string'
    ? match.match_date
    : match.match_date.toISOString().split('T')[0];
  const matchDt = new Date(`${dateStr}T${match.match_time}`);
  if (matchDt > new Date()) {
    req.session.flash = 'Cannot submit result: match has not yet taken place.';
    return res.redirect('/referee/match-history');
  }
  const participants = await q.getMatchParticipants(req.params.matchId);
  res.render('referee/submit_result', { match, participants });
});

router.post('/submit-result/:matchId', guard, async (req, res) => {
  const matchId = req.params.matchId;
  const match   = await q.getMatchForReferee(matchId, req.session.user.id);
  if (!match) { req.session.flash = 'Unauthorized.'; return res.redirect('/referee/match-history'); }

  const participants = await q.getMatchParticipants(matchId);
  const playerStats  = participants.map(p => ({
    playerId:     p.player_id,
    goals:        req.body[`goals_${p.player_id}`]    || 0,
    assists:      req.body[`assists_${p.player_id}`]  || 0,
    yellowCards:  req.body[`yellow_${p.player_id}`]   || 0,
    redCards:     req.body[`red_${p.player_id}`]      || 0,
    minutesPlayed:req.body[`minutes_${p.player_id}`]  || 0,
    position:     req.body[`position_${p.player_id}`] || '',
    rating:       req.body[`rating_${p.player_id}`]   || null,
  }));

  // Build a lookup of player_id → club_id from the fetched participants
  const clubOf = {};
  for (const p of participants) clubOf[p.player_id] = p.club_id;

  const homeGoals = parseInt(req.body.home_goals, 10);
  const awayGoals = parseInt(req.body.away_goals, 10);

  const homePlayerGoals = playerStats
    .filter(s => clubOf[s.playerId] === match.home_club_ID)
    .reduce((sum, s) => sum + parseInt(s.goals, 10), 0);
  const awayPlayerGoals = playerStats
    .filter(s => clubOf[s.playerId] === match.away_club_ID)
    .reduce((sum, s) => sum + parseInt(s.goals, 10), 0);

  // Per-player: no single player can score more than their team's total
  for (const s of playerStats) {
    const g = parseInt(s.goals, 10);
    const teamMax = clubOf[s.playerId] === match.home_club_ID ? homeGoals : awayGoals;
    if (g > teamMax) {
      req.session.flash = `Invalid stats: a player cannot score more goals (${g}) than their team scored (${teamMax}).`;
      return res.redirect(`/referee/submit-result/${matchId}`);
    }
  }

  if (homePlayerGoals !== homeGoals) {
    req.session.flash = `Goal mismatch: score shows ${homeGoals} home goal(s) but player stats total ${homePlayerGoals}.`;
    return res.redirect(`/referee/submit-result/${matchId}`);
  }
  if (awayPlayerGoals !== awayGoals) {
    req.session.flash = `Goal mismatch: score shows ${awayGoals} away goal(s) but player stats total ${awayPlayerGoals}.`;
    return res.redirect(`/referee/submit-result/${matchId}`);
  }

  try {
    await q.submitResult({
      matchId,
      homeGoals:  req.body.home_goals,
      awayGoals:  req.body.away_goals,
      attendance: req.body.attendance,
      playerStats,
    });
    req.session.flash = 'Match result submitted successfully.';
    res.redirect('/referee/match-history');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect(`/referee/submit-result/${matchId}`);
  }
});

module.exports = router;
