// routes/player.js — HTTP layer only; all SQL is in queries/player.js
const express  = require('express');
const q        = require('../queries/player');
const { requireLogin } = require('../middleware/auth');
const router   = express.Router();
const guard    = requireLogin('player');

router.get('/', guard, async (req, res) => {
  const player = await q.getPlayerProfile(req.session.user.id);
  res.render('player/dashboard', { player });
});

router.get('/performance', guard, async (req, res) => {
  const uid = req.session.user.id;
  const { competition_id = '', season = '' } = req.query;
  const [competitions, seasons] = await Promise.all([
    q.getPlayerCompetitions(uid),
    q.getPlayerSeasons(uid),
  ]);
  let stats, filterLabel;
  if (competition_id && season) {
    stats = await q.getCompetitionSeasonStats(uid, competition_id, season);
    filterLabel = 'Competition + Season';
  } else if (season) {
    stats = await q.getSeasonStats(uid, season);
    filterLabel = `Season: ${season}`;
  } else {
    stats = await q.getCareerStats(uid);
    filterLabel = 'Career';
  }
  res.render('player/performance', { stats, filterLabel, competitions, seasons, competition_id, season });
});

router.get('/match-history', guard, async (req, res) => {
  const matches = await q.getMatchHistory(req.session.user.id);
  res.render('player/match_history', { matches });
});

router.get('/career-history', guard, async (req, res) => {
  const [contracts, transfers] = await Promise.all([
    q.getContractHistory(req.session.user.id),
    q.getTransferHistory(req.session.user.id),
  ]);
  res.render('player/career_history', { contracts, transfers });
});

module.exports = router;
