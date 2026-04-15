// routes/auth.js — login, logout, register for all roles
const express  = require('express');
const crypto   = require('crypto');
const db       = require('../db');
const router   = express.Router();

// ── Helpers ───────────────────────────────────────────────────────────────

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
  return null; // valid
}

// ── Index ─────────────────────────────────────────────────────────────────

router.get('/', (req, res) => res.render('index'));

// ── Login ─────────────────────────────────────────────────────────────────

router.get('/login', (req, res) => res.render('login'));

router.post('/login', async (req, res) => {
  const { username, password, role } = req.body;

  if (!username || !password || !role) {
    res.locals.flash = 'Please fill in all fields.';
    return res.render('login');
  }

  const pwHash = hashPassword(password);

  try {
    if (role === 'db_manager') {
      const row = await db.queryOne(
        'SELECT db_manager_id AS uid, username FROM DatabaseManager WHERE username = ? AND password_hash = ?',
        [username, pwHash]
      );
      if (row) {
        req.session.user = { id: row.uid, username: row.username, role: 'db_manager' };
        return res.redirect('/db-manager');
      }
    } else {
      const tableMap = { player: 'Player', manager: 'Manager', referee: 'Referee' };
      if (!tableMap[role]) {
        res.locals.flash = 'Unknown role.';
        return res.render('login');
      }
      const row = await db.queryOne(
        `SELECT p.person_ID AS uid, p.username, p.name, p.surname
         FROM Person p
         INNER JOIN \`${tableMap[role]}\` r ON r.person_ID = p.person_ID
         WHERE p.username = ? AND p.password_hash = ?`,
        [username, pwHash]
      );
      if (row) {
        req.session.user = {
          id: row.uid, username: row.username,
          name: row.name, surname: row.surname, role,
        };
        return res.redirect(`/${role}`);
      }
    }

    res.locals.flash = 'Invalid username or password.';
    res.render('login');
  } catch (err) {
    res.locals.flash = `DB error: ${err.message}`;
    res.render('login');
  }
});

// ── Logout ────────────────────────────────────────────────────────────────

router.get('/logout', (req, res) => {
  req.session.destroy(() => res.redirect('/login'));
});

// ── Register: choose role ─────────────────────────────────────────────────

router.get('/register', (req, res) => res.render('register_choose'));

// ── Register: Player ──────────────────────────────────────────────────────

router.get('/register/player', (req, res) => res.render('register_player'));

router.post('/register/player', async (req, res) => {
  const { username, password, name, surname, nationality,
          date_of_birth, market_value, main_position, strong_foot, height_cm } = req.body;

  const err = validatePassword(password);
  if (err) { req.session.flash = err; return res.render('register_player', { body: req.body }); }

  try {
    const pid    = await db.nextId('Person', 'person_ID');
    const pwHash = hashPassword(password);
    await db.execute(
      'INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES (?,?,?,?,?,?,?)',
      [pid, username, pwHash, name, surname, nationality, date_of_birth]
    );
    await db.execute(
      'INSERT INTO Player (person_ID, market_value, main_position, strong_foot, height_cm) VALUES (?,?,?,?,?)',
      [pid, market_value, main_position, strong_foot, height_cm]
    );
    req.session.flash = 'Registration successful. Please log in.';
    res.redirect('/login');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.render('register_player', { body: req.body });
  }
});

// ── Register: Manager ─────────────────────────────────────────────────────

router.get('/register/manager', (req, res) => res.render('register_manager'));

router.post('/register/manager', async (req, res) => {
  const { username, password, name, surname, nationality,
          date_of_birth, preferred_formation, experience_level } = req.body;

  const err = validatePassword(password);
  if (err) { req.session.flash = err; return res.render('register_manager', { body: req.body }); }

  try {
    const pid    = await db.nextId('Person', 'person_ID');
    const pwHash = hashPassword(password);
    await db.execute(
      'INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES (?,?,?,?,?,?,?)',
      [pid, username, pwHash, name, surname, nationality, date_of_birth]
    );
    await db.execute(
      'INSERT INTO Manager (person_ID, preferred_formation, experience_level) VALUES (?,?,?)',
      [pid, preferred_formation, experience_level]
    );
    req.session.flash = 'Registration successful. Please log in.';
    res.redirect('/login');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.render('register_manager', { body: req.body });
  }
});

// ── Register: Referee ─────────────────────────────────────────────────────

router.get('/register/referee', (req, res) => res.render('register_referee'));

router.post('/register/referee', async (req, res) => {
  const { username, password, name, surname, nationality,
          date_of_birth, license_level, years_experience } = req.body;

  const err = validatePassword(password);
  if (err) { req.session.flash = err; return res.render('register_referee', { body: req.body }); }

  try {
    const pid    = await db.nextId('Person', 'person_ID');
    const pwHash = hashPassword(password);
    await db.execute(
      'INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES (?,?,?,?,?,?,?)',
      [pid, username, pwHash, name, surname, nationality, date_of_birth]
    );
    await db.execute(
      'INSERT INTO Referee (person_ID, license_level, years_experience) VALUES (?,?,?)',
      [pid, license_level, years_experience]
    );
    req.session.flash = 'Registration successful. Please log in.';
    res.redirect('/login');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.render('register_referee', { body: req.body });
  }
});

// ── Register: Database Manager ────────────────────────────────────────────

router.get('/register/db-manager', (req, res) => res.render('register_db_manager'));

router.post('/register/db-manager', async (req, res) => {
  const { username, password } = req.body;

  const err = validatePassword(password);
  if (err) { req.session.flash = err; return res.render('register_db_manager', { body: req.body }); }

  try {
    const pwHash = hashPassword(password);
    await db.execute(
      'INSERT INTO DatabaseManager (username, password_hash) VALUES (?,?)',
      [username, pwHash]
    );
    req.session.flash = 'Registration successful. Please log in.';
    res.redirect('/login');
  } catch (err) {
    req.session.flash = `Error: ${err.message}`;
    res.render('register_db_manager', { body: req.body });
  }
});

module.exports = router;
