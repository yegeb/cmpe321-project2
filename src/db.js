// db.js — MySQL connection pool and query helpers
// Uses mysql2 prepared statements (parameterized queries) throughout.

require('dotenv').config();
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host:               process.env.DB_HOST,
  user:               process.env.DB_USER,
  password:           process.env.DB_PASSWORD,
  database:           process.env.DB_NAME,
  socketPath:         process.env.DB_SOCKET,   // e.g. /tmp/mysql.sock on macOS
  charset:            'utf8mb4',
  waitForConnections: true,
  connectionLimit:    10,
});

/** Run a SELECT; returns array of row objects. */
async function query(sql, params = []) {
  const [rows] = await pool.execute(sql, params);
  return rows;
}

/** Run a SELECT; returns the first row or null. */
async function queryOne(sql, params = []) {
  const rows = await query(sql, params);
  return rows[0] ?? null;
}

/** Run INSERT / UPDATE / DELETE; returns the ResultSetHeader. */
async function execute(sql, params = []) {
  const [result] = await pool.execute(sql, params);
  return result;
}

/** Return MAX(col)+1 from table — simple sequential ID generation. */
async function nextId(table, col) {
  const row = await queryOne(
    `SELECT COALESCE(MAX(\`${col}\`), 0) + 1 AS nxt FROM \`${table}\``
  );
  return row.nxt;
}

module.exports = { query, queryOne, execute, nextId };
