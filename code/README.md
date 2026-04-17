# CMPE321 Project 2 - TransferDB

## Project Overview
This project implements the database application layer for the TransferDB system designed in Project 1. The initial setup includes creating a robust foundation with Express.js (backend), EJS (frontend views), and MySQL (database connector).

## What Has Been Completed So Far
1. **Application Architecture & UI Panels**: The Express.js server, EJS templates, and role-based navigation loops are fully set up. Every role has its own dashboard and dedicated UI panels according to the project description.
2. **Authentication & Password Hashing**: Registration and login flows are fully operational. Passwords are securely hashed (using SHA-256) before being saved to the database, enforcing security standards.
3. **Manager Module**: The Manager role is 100% complete. All routing (`src/routes/manager.js`) and corresponding SQL queries (`src/queries/manager.js`) for viewing fixtures, standings, squad stats, submitting squads, and checking leaderboards have been fully implemented.
4. **Player Module**: The Player role is 100% complete. All routing (`src/routes/player.js`) and corresponding SQL queries (`src/queries/player.js`) for viewing profiles, career statistics, and match history are fully functional.

## Friend's Workspace (Where you should work)
Your friend will be responsible for implementing the raw SQL queries and logic for the **Database Manager** and **Referee** roles.

You will primarily work in these two files:
- `src/queries/dbManager.js`: Contains `// TODO` markers for **Operations 2, 3, 9, 10, 11, and 12** (Viewing stadiums, scheduling matches, registering transfers, renaming stadiums, assigning managers, and creating competitions).
- `src/queries/referee.js`: Contains `// TODO` markers for **Operations 13, 14, and 15** (Submitting match results, career statistics, and match history).

**Instructions for Friend:**
Inside those files, you will find function skeletons. Your task is to write raw SQL commands (using variables via the `db` adapter) in place of the `// TODO` comments to correctly fetch or update data in the MySQL database. Do not change the function definitions, just inject the appropriate database query execution code. You can test your results through the web interface.

## How to Set Up the Project Locally
If you want to run the project panels and see your changes interactively, follow these steps:

1. **Provide the `.env` File**: Ask your partner for the `.env` file (it contains the database credentials) and place it inside the `src/` folder.
2. **Install Node.js & Dependencies**: 
   Make sure Node.js is installed. Open your terminal in the `src/` folder and run:
   ```bash
   cd src
   npm install
   ```
3. **Initialize the Database**:
   You can initialize or seed the database using `src/schema.sql` and `src/init_data.sql`, or by importing the CSV tables from the `initial_data_csv/` folder.
4. **Start the Application**:
   Inside the `src/` folder, run:
   ```bash
   node app.js
   ```
5. **Access the Panels**:
   Open a web browser and go to **`http://localhost:3000`**. You can test your SQL implementations by browsing through the specific pages defined for the DB Manager and Referee roles.
