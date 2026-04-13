// routes/manager.js — HTTP layer only; all SQL is in queries/manager.js
const express  = require('express');
const q        = require('../queries/manager');
const { requireLogin } = require('../middleware/auth');
const router   = express.Router();
const guard    = requireLogin('manager');

router.get('/', guard, async (req, res) => {
  const manager = await q.getManagerProfile(req.session.user.id);
  const club    = await q.getManagerClub(req.session.user.id);
  res.render('manager/dashboard', { manager, club });
});

router.get('/fixtures', guard, async (req, res) => {
  const club = await q.getManagerClub(req.session.user.id);
  if (!club) { req.session.flash = 'You are not assigned to any club.'; return res.redirect('/manager'); }

  const { competition_id = '', season = '' } = req.query;
  const [competitions, seasons, fixtures] = await Promise.all([
    q.getClubCompetitions(club.club_ID),
    q.getClubSeasons(club.club_ID),
    q.getFixtures(club.club_ID, { competitionId: competition_id, season }),
  ]);
  res.render('manager/fixtures', { fixtures, club, competitions, seasons, competition_id, season });
});

router.get('/submit-squad/:matchId', guard, async (req, res) => {
  const club = await q.getManagerClub(req.session.user.id);
  if (!club) { req.session.flash = 'No club assigned.'; return res.redirect('/manager'); }
  const match = await q.getMatchForClub(req.params.matchId, club.club_ID);
  if (!match) { req.session.flash = 'Match not found.'; return res.redirect('/manager/fixtures'); }
  const eligible   = await q.getEligiblePlayers(club.club_ID);
  const alreadyRows = await q.getMatchSquad(req.params.matchId, club.club_ID);
  const alreadyIds  = new Set(alreadyRows.map(r => r.player_id));
  res.render('manager/submit_squad', { match, eligible, alreadyIds, club });
});

router.post('/submit-squad/:matchId', guard, async (req, res) => {
  const club     = await q.getManagerClub(req.session.user.id);
  const matchId  = req.params.matchId;
  const selected = [].concat(req.body.player_id  || []);
  const starters = new Set([].concat(req.body.is_starter || []));

  if (selected.length < 11 || selected.length > 23) {
    req.session.flash = 'Squad must have 11–23 players.';
    return res.redirect(`/manager/submit-squad/${matchId}`);
  }
  if (starters.size > 11) {
    req.session.flash = 'A maximum of 11 starters is allowed.';
    return res.redirect(`/manager/submit-squad/${matchId}`);
  }
  try {
    await q.submitSquad(matchId, club.club_ID, selected, starters);
    req.session.flash = 'Squad submitted.';
    res.redirect('/manager/fixtures');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.redirect(`/manager/submit-squad/${matchId}`);
  }
});

router.get('/standings', guard, async (req, res) => {
  const club = await q.getManagerClub(req.session.user.id);
  if (!club) { req.session.flash = 'No club assigned.'; return res.redirect('/manager'); }
  const { competition_id = '' } = req.query;
  const competitions = await q.getLeagueCompetitions(club.club_ID);
  const standings    = competition_id ? await q.getStandings(competition_id) : [];
  res.render('manager/standings', { competitions, standings, competition_id });
});

router.get('/squad-stats', guard, async (req, res) => {
  const club = await q.getManagerClub(req.session.user.id);
  if (!club) { req.session.flash = 'No club assigned.'; return res.redirect('/manager'); }
  const { competition_id = '', season = '' } = req.query;
  const [competitions, seasons] = await Promise.all([
    q.getClubCompetitions(club.club_ID),
    q.getClubSeasons(club.club_ID),
  ]);
  // Per spec: filter by season alone, or competition + season, else current roster.
  const players = season
    ? await q.getSquadStatsHistorical(club.club_ID, season, competition_id || null)
    : await q.getSquadStatsCurrent(club.club_ID);
  res.render('manager/squad_stats', { players, club, competitions, seasons, competition_id, season });
});

router.get('/leaderboards', guard, async (req, res) => {
  const club = await q.getManagerClub(req.session.user.id);
  if (!club) { req.session.flash = 'No club assigned.'; return res.redirect('/manager'); }
  const { competition_id = '', category = 'goals' } = req.query;
  const competitions = await q.getClubCompetitions(club.club_ID);
  let topPlayers = [];
  if (competition_id) {
    if      (category === 'goals')   topPlayers = await q.getTopScorers(competition_id);
    else if (category === 'assists') topPlayers = await q.getTopAssists(competition_id);
    else if (category === 'rating')  topPlayers = await q.getTopRatings(competition_id);
  }
  res.render('manager/leaderboards', { competitions, topPlayers, competition_id, category });
});

module.exports = router;
