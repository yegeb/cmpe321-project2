// queries/dbManager.js
// All SQL for the Database Manager role lives here.
const db = require('../db');

// Operation 2: View stadiums
async function getStadiums() {
  // TODO: Implement SQL query to get stadiums
  return [];
}

async function getStadiumList() {
  // TODO: Implement SQL query for getting stadium list
  return [];
}

// Operation 10: Rename a stadium
async function renameStadium(stadiumId, newName) {
  // TODO: Implement SQL query to rename a stadium
}

// Operation 3: Schedule a match
async function getClubs() {
  // TODO: Implement SQL query to get clubs
  return [];
}

async function getStadiumsWithCity() {
  // TODO: Implement SQL query to get stadiums with their city
  return [];
}

async function getReferees() {
  // TODO: Implement SQL query to get referees
  return [];
}

async function getCompetitions() {
  // TODO: Implement SQL query to get competitions
  return [];
}

async function scheduleMatch({ matchDate, matchTime, stadiumId, homeClubId, awayClubId, refereeId, competitionId }) {
  // TODO: Implement SQL query and logic to schedule a match
  return null;
}

// Operation 12: Create competition
async function createCompetition({ name, season, country, competitionType }) {
  // TODO: Implement SQL query to create a competition
  return null;
}

// Operation 11: Manage manager-club assignments
async function getManagers() {
  // TODO: Implement SQL query to get managers
  return [];
}

async function getCurrentAssignments() {
  // TODO: Implement SQL query to get current assignments
  return [];
}

async function assignManager({ managerId, clubId, startDate }) {
  // TODO: Implement SQL query to assign a manager
}

async function removeManagerAssignment(managerId) {
  // TODO: Implement SQL query to remove a manager assignment
}

// Operation 9: Register transfer & contract
async function getPlayers() {
  // TODO: Implement SQL query to get players
  return [];
}

async function registerTransfer({ playerId, fromClubId, toClubId, transferType, transferFee, contractType, weeklyWage, endDate }) {
  // TODO: Implement SQL query logic to register transfer and contract
}

module.exports = {
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
