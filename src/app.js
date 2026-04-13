// app.js — TransferDB Express application entry point
require('dotenv').config();
const path    = require('path');
const express = require('express');
const session = require('express-session');

const app = express();

// ── View engine ───────────────────────────────────────────────────────────
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// ── Body parser ───────────────────────────────────────────────────────────
app.use(express.urlencoded({ extended: false }));

// ── Session ───────────────────────────────────────────────────────────────
app.use(session({
  secret:            process.env.SESSION_SECRET,
  resave:            false,
  saveUninitialized: false,
}));

// ── Globals for every template ────────────────────────────────────────────
app.use((req, res, next) => {
  res.locals.user  = req.session.user  ?? null;
  res.locals.flash = req.session.flash ?? null;
  delete req.session.flash;
  next();
});

// ── Routes ────────────────────────────────────────────────────────────────
app.use('/',            require('./routes/auth'));
app.use('/db-manager',  require('./routes/dbManager'));
app.use('/manager',     require('./routes/manager'));
app.use('/player',      require('./routes/player'));
app.use('/referee',     require('./routes/referee'));

// ── 404 ───────────────────────────────────────────────────────────────────
app.use((req, res) => res.status(404).send('404 Not Found'));

// ── Start ─────────────────────────────────────────────────────────────────
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`TransferDB running at http://localhost:${PORT}`));
