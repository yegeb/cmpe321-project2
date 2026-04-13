# Project 2: TransferDB Application
**CMPE 321, Introduction to Database Systems, Spring 2026**
**Deadline: 17 April 2026, 17:00**

## 1 Introduction
In Project 1, you designed TransferDB, a relational database system to manage the complex ecosystem of modern football. The design captured intricate relationships between players, managers, clubs, matches, and the ever-active transfer market while enforcing strict structural constraints.

In this project, you will implement TransferDB as a working database application. The system will support multiple user roles, including players, managers, and referees, and enable real-world operations such as match scheduling, squad registration, and contract management. Additional constraints that could not be fully enforced through basic DDL will be handled using triggers, procedures, and other mechanisms, ensuring both functional and data integrity in the application.

## 2 Project Description
This project involves the implementation of the TransferDB database application, whose conceptual and logical design was developed in Project 1. You are expected to develop a database-backed application that supports multiple user roles and performs real-world operations while enforcing domain-specific constraints.

The application must be connected to a MySQL database using SQL queries written manually. You must not use any Object-Relational Mapping (ORM) tool such as SQLAlchemy, Django ORM, or Hibernate. The goal of this project is to write and understand SQL yourself, including table creation, data manipulation, and trigger logic.

### 2.1 Supported User Roles
- **Database Managers**: These are the primary administrators of the TransferDB application, acting with centralized authority to ensure the structural and operational integrity of the system. Their abilities include: viewing stadiums, updating stadium names, creating new users (such as players, managers, and referees), assigning registered managers to their respective clubs, and creating new competitions (e.g., 2025/2026 Premier League). Furthermore, they are responsible for registering all player transfers and contracts, as well as maintaining the global league calendar by scheduling matches to ensure no timing or venue conflicts occur. New database managers can be added to the system; therefore, you are expected to create a signup page that allows these users (as well as others) to register with a username and password.
    - **Attributes**: username, password

- **Players**: Players are registered users with market values, main positions, and physical attributes. They can either register themselves or be added to the system by the Database Managers. They can view their contract history, transfer records, and match performance statistics. Furthermore, they can access a detailed chronological record of every match they participated in and monitor their professional development through performance statistics filtered by career, season, or competition.
    - **Attributes**: username, password, name, surname, nationality, date of birth, market value, main position, strong foot, height

- **Managers**: Managers run the clubs and are responsible for squad and match-related operations. Like players, they can either register themselves or be added to the system by the Database Managers. A manager can only be assigned to one club at a time. Their primary responsibilities include maintaining the club’s fixtures and results, and selecting match squads (starters and substitutes) from their active roster. Furthermore, they are responsible for monitoring team performance through detailed squad statistics and league standings and utilizing scouting tools such as competition leaderboards to identify top-performing targets.
    - **Attributes**: username, password, name, surname, nationality, date of birth, preferred formation, experience level

- **Referees**: Referees are the official match officials of the TransferDB system. Like players and club managers, they can either register themselves or be added to the system by the Database Managers. Each match must have exactly one assigned referee who is responsible for submitting the match outcome, including final scores and attendance, as well as detailed player performance statistics (goals, assists, cards, and ratings) after the match has taken place. Furthermore, they can monitor their professional history by viewing their officiating career statistics and a detailed match record, which includes a total count of all red and yellow cards issued throughout their career.
    - **Attributes**: username, password, name, surname, nationality, date of birth, license level, years of experience

### 2.2 Key Operations
Your application should allow users to perform the following operations depending on their roles. The interface does not need to be fancy; the focus is on correct logic, data consistency, and enforcing the rules using appropriate SQL constructs.

1.  **Registration, login, and role-based access**: All users should be able to register for an account and log in using their credentials. Based on their role (player, manager, referee, or database manager), they should see different functionality and their specific personal information.
    - **Players**: View their own profile details: name, age, nationality, current club, height, main position, strong foot, and market value.
    - **Managers**: Must be able to view their name, age, nationality, current club, experience level, and preferred formation.
    - **Referees**: Must be able to view their name, age, nationality, license level and years of experience.

2.  **Viewing available stadiums (Database Manager)**: Database Managers can view a list of all stadiums, including their names, cities, and capacities along with the club or clubs that use each stadium as their home ground. This view provides the necessary context for the Database Manager to coordinate match scheduling.

3.  **Scheduling a match (Database Manager)**: DB Managers can schedule new matches by selecting the date, time, stadium, the home and the away opposing club, an available referee, and the competition the match belongs to.
    - **Note**: Matches must not overlap in time or place. A match lasts exactly 120 minutes. No stadium, club, or referee can be involved in two matches whose start times are within 120 minutes of each other. Matches must be scheduled for a future time.

4.  **Viewing Fixtures and Results (Manager)**: Managers can view a chronological (sorted by date in descending order) list of all matches associated with their assigned club, both past (completed) and future (scheduled). They must be able to filter this list by specific competitions and seasons. The view should display the match date, the opposing club, the competition, the stadium, the final score (or indicate if the match is yet to be played) and the inferred result (win, lose or draw) if applicable.

5.  **Submitting a match squad (Manager)**: Managers can select players from their active club roster to participate in a scheduled match.
    - **Note**: Only players currently under an active contract (Permanent or Loan) with the club can be selected. A maximum of 11 players can be marked as is starter, and the total squad must be between 11 and 23 players. A player on loan cannot participate in matches as part of their parent club.

6.  **Viewing League Standings (Manager)**: Managers can view the current league table for any competition (where the competition type is ‘League’) and season in which their assigned club has participated. The standings must display the participating clubs ranked by Total Points, followed by Goal Difference. The displayed table should include the following columns: Club Name, Matches Played, Wins, Draws, Losses, Goals Scored, Goals Conceded, Goal Difference, and Total Points.
    - **Note**: Points are calculated as follows: 3 points for a win, 1 point for a draw, and 0 points for a loss.

7.  **Viewing Squad Statistics (Manager)**: Managers can view name, age, main position, strong foot, height, market value, and nationality for the players in their current club’s squad. Additionally, they can view aggregated statistical summaries: total matches played, goals, assists, yellow/red cards, average rating, and average minutes played.
    - **Current Squad View**: Display the statistics for all players who currently hold an active contract with the manager’s club. Crucially, these statistics must only reflect their performances while playing for this specific club, representing their all-time aggregated totals across all seasons and competitions for this team.
    - **Historical Competition View**: If the manager filters by a season or a competition and a season, the system must display the statistics of all players who represented the club in those specific matches.

8.  **Viewing Competition Leaderboards (Manager)**: Managers can scout the top-performing players across the competitions their club has participated in to identify high-value targets.
    - **Note**: Top Performer Categories: The view must allow managers to see the top 10 players for the following categories within a selected competition and season: “Top Goal Scorers”, “Top Assist Providers” and “Highest Average Match Rating” (minimum of 3 matches played to avoid statistical outliers).
    - **Note**: For each player in the rankings, the system must display their name, club, matches played in that competition, and their specific metric for that category (e.g., total goals).

9.  **Registering a Transfer and Contract (Database Manager)**: Database Managers can move a player between clubs or register a new contract. To perform this, DB manager must provide the player, the destination club, the contract type, the salary, the transfer fee, and the end date of the new contract.
    - **Note**: Every transfer must generate a Transfer Record containing the provided fee. The system must set the transfer date and the start date of the new contract to the current system date. For purchase transfers the player’s market value must be updated to match the transfer fee.
    - **Note**: The system must enforce the constraint that a player can have at most two active contracts (one Permanent, one Loan) simultaneously. When a player is transferred via a new Permanent contract, the system must automatically terminate their previous Permanent contract (e.g., by updating its end date to the new start date). A Loan contract cannot be created if the player does not have an active Permanent contract with another club.

10. **Renaming a stadium (Database Manager)**: Database managers can update the name of any stadium. The change should be reflected consistently across all related records.

11. **Managing club manager assignments (Database Manager)**: Database managers can assign a registered manager to a specific club, as well as update this assignment if a manager moves to a new club.
    - **Note**: The system must enforce that a manager can only manage one club at a time, and a club can only have one active manager at any given time. A club can be left without a manager temporarily during this manager assignments.

12. **Creating a Competition (Database Manager)**: Database managers are responsible for adding new competitions to the system so that matches can be scheduled. They must specify the competition’s name (e.g., Premier League, UEFA Champions League), the season (e.g., 2025/2026), the country, and the competition type (League, Cup, or International).
    - **Note**: The system must enforce the constraint that the combination of competition name and season is strictly unique; the exact same competition cannot run twice in a single season.

13. **Submitting match results (Referee)**: Referees can submit the attendance, final score (home goals, away goals) and player stats (goals, assists, yellow/red cards, minutes played, position in match and rating) for a match they are assigned to, but only after the scheduled match time has passed.
    - **Note**: Attendance must not exceed the stadium capacity.

14. **Viewing referee statistics (Referee)**: Referees can view how many matches they have officiated and the total number of red/yellow cards they have issued across all their matches.

15. **Viewing referee match history (Referee)**: Referees can view an overview of their officiating career and a detailed record of their matches. For each match, the view must display the date and time, competition, stadium, and attendance. The match record must show the final result (score) and total yellow and red cards issued.
    - **Note**: For matches that have not yet taken place, the system should indicate a “Scheduled” status.

16. **Viewing performance statistics (Player)**: Players can analyze their performance data through various lenses. The system must provide three views for their statistical totals (Games Played, Goals, Assists, Yellow/Red Cards, and Average Rating):
    - **Career Aggregation**: By default it should display the player’s total statistics accumulated across all clubs and competitions throughout their entire career.
    - **Seasonal Filtering**: Players must be able to filter their statistics to see totals for a specific season across all competitions they played in during that year.
    - **Competition & Season Filtering**: Players must be able to filter statistics for a specific competition within a specific season (e.g., “Premier League” in “2025/2026”).

17. **Viewing player’s match history (Player)**: Players can access a detailed, chronological record of every match they have participated in. For each match, the view must display the date and time, competition, stadium, opposing club, and the final result. The record must also show the player’s individual statistics for that specific game, including minutes played, position played, goals and assists, yellow/red cards, and match rating.

18. **Viewing Career History (Player)**: Players can view the official records of their professional movement and financial agreements.
    - **Contract History**: A detailed list of all current and past contracts, showing the club, salary, contract type, and start/end dates.
    - **Transfer History**: A record of every transfer they have been involved in, including the transfer date, fee, source club, destination club and transfer type.

### 2.3 Important Notice
Your database will be initialized with a dataset that may include intentionally invalid records, such as overlapping match times, players with more than two active contracts, or matches with too many starters. These inconsistencies are provided on purpose and should remain in the database as they are. Your goal is not to clean or delete these records, but rather to ensure that no new invalid records can be inserted into the system. You are encouraged to use CHECK constraints, triggers, or stored procedures wherever schema-level enforcement is insufficient. You should ensure that invalid data cannot be added, even if some preloaded records are intentionally incorrect.

For example:
- A new match should not be scheduled if there is a 120-minute time conflict for the stadium, referee, or clubs.
- A manager cannot sign a player on Loan if that player lacks a parent club.
- A match squad cannot be submitted with more than 11 starters.
- A match result cannot be submitted by someone other than the assigned referee.

These constraints will be tested during the demo by attempting to insert invalid data. If your system does not prevent these actions, you will lose points accordingly.

## 3 Schema Refinement and Normalization
You are expected to analyze and refine the database schema you designed in Project 1. This step should ensure that your design adheres to normalization principles and that the schema effectively captures functional dependencies (FDs).

- First, list all non-trivial functional dependencies in your schema.
- Then, for each relation, determine whether it satisfies Boyce-Codd Normal Form (BCNF).
- If a relation is not in BCNF, check whether it is in Third Normal Form (3NF).
- If a relation does not satisfy BCNF, either:
    - Decompose it into BCNF-compliant relations, or
    - Clearly justify why decomposition was not performed.
- If you decompose a relation, indicate whether your decomposition is:
    - Lossless-join
    - Dependency preserving

Even if your original schema is already in BCNF, you must still explain how the requirements of BCNF are satisfied in terms of the functional dependencies for each relation.

In addition to normalization, you should revisit your schema to capture constraints that were not enforced in Project 1. Use SQL features such as CHECK, triggers, and stored procedures to enforce those rules. Please explain which additional constraints you were able to enforce and how in your report.

## 4 Requirements & Security
**Password Policy**: When creating a new user, the system must validate the password according to the following rules:
- Minimum length: 8 characters
- Must include at least one uppercase letter [A-Z]
- Must include at least one lowercase letter [a-z]
- Must include at least one digit [0-9]
- Must include at least one special character (e.g., @, #, $, %, &, etc.)

If the password does not satisfy these requirements, the insertion must be rejected, and an appropriate error message should be displayed.

**Password Encryption**: All passwords must be stored in an encrypted form in the database. Plain-text passwords are strictly forbidden. You must hash passwords using a secure algorithm (e.g., SHA-256, bcrypt, or similar), and authenticate users by comparing the hash of the input password against the stored hash.

**Input Sanitization & SQL Injection Prevention**: Since you are required to write raw SQL queries without the use of ORMs, your application is inherently at risk of SQL injection attacks. You must properly sanitize all user inputs across the entire web application. You are strictly required to use Parameterized Queries (or Prepared Statements) supported by your chosen database connector (e.g., using %s in Python’s mysql-connector). Directly concatenating user input strings into your SQL commands is strictly forbidden. During the demo, grading assistants will attempt basic SQL injection payloads (e.g., ‘ OR ‘1’=‘1) on your login screens and search forms. If your application executes the payload or crashes, you will lose points.

**Strict Enforcement Rule**: All logic and domain constraints must be enforced at the database level (using CHECK constraints, TRIGGERs, or Stored Procedures). It is strictly forbidden to rely exclusively on application-level logic (e.g., IF/ELSE statements in your backend code) to prevent invalid data. Your database must protect its own integrity regardless of the application connecting to it.

**Note on Exceptions**: Security-related operations, specifically Password Policy validation, Password Hashing (Encryption), and Input Sanitization (Prepared Statements), should be handled within the Application side (Backend) to ensure modern security standards and protect plain-text credentials.

During the demo, the grading assistants may bypass your web interface and attempt to insert invalid records directly via a MySQL client. If your database accepts the invalid data because the constraint was only handled in the web application, you will lose points for that constraint.

For example:
- A new match should not be scheduled if there is a 120-minute time conflict for the stadium, referee, or clubs.
- A manager cannot sign a player on Loan if that player lacks a parent club.
- A match squad cannot be submitted with more than 11 starters.
- A match result cannot be submitted by someone other than the assigned referee.

Constraints like these will be tested rigorously. If your system relies on the frontend or backend application code to stop these actions rather than database triggers or checks, it will be considered incorrect.

## 5 Notes
- You are not expected to design a fancy interface. A simple web interface with minimal or no CSS/JavaScript is acceptable.
- You may use a backend framework (such as Django, Flask, Express, etc.) but all SQL queries must be written manually by you.
- You must boot your own database server and set up your tables manually.
- You are not allowed to use any ORM tools. Do not use your database connector to dynamically build queries. Queries should be written as SQL strings and passed to the connector for execution.
- The application does not need to be deployed. Running locally is sufficient.
- Only MySQL is allowed.
- All date values must follow the format: YYYY-MM-DD (native MySQL format). Make sure your SQL queries and input forms conform to this format.
- There will be a demo session where you will be asked to show specific operations working correctly from your interface. Demo details will be announced later.
- Your grade will be based 80% on the demo and 20% on Part 3 of this documentation.

## 6 Submission
This project must be completed and submitted in teams of two students. Each team must submit a single ZIP file that includes all deliverables.

### Submission Format
- Each team must submit a ZIP file named as: GroupXX.zip, where XX is your assigned group number.
- The following items must be placed directly inside the ZIP file (not in subfolders unless specified):
    - **code/** directory: All your implementation files including SQL scripts, trigger definitions, procedures, and your interface/backend code.
    - **part3.pdf**: Your written report for the Schema Refinement and Normalization section.
    - **Student1ID_Contribution.pdf**: Individual Contribution Report for Student 1
    - **Student2ID_Contribution.pdf**: Individual Contribution Report for Student 2

### Individual Contribution Report Guidelines
Each student must prepare an Individual Contribution Report and include it in the group ZIP file. The report must be in PDF format, named as: Student_ID_Contribution.pdf (e.g., 123456_Contribution.pdf).

**What to Include**:
- **Personal Information**: Name, Student ID, Group Number.
- **Tasks & Contributions**: Briefly describe what you worked on (schema normalization, triggers, procedures, backend, frontend, queries, documentation, debugging, etc.).
- **Collaboration & Challenges**: How the team worked together, any difficulties, and how they were resolved.
- **Self-Assessment**: Reflection on your role, skills learned, and areas for improvement.
- **Use of AI Tools**: Specify which AI tools were used (if any), how they were used for your specific tasks, and how they helped you obtain a better solution.

**Formatting**:
- Length: 1 page (max 2 pages)
- Font & Size: Times New Roman, 12pt, 1.5 spacing
- File Format: PDF

### Late Submission Policy
- One day late: -20 points. (even one minute will be considered a day late)
- Two days late: -50 points. (even one minute and a day will be considered two days late)
- Moodle closes after two days.

## 7 Academic Integrity
Plagiarism or sharing solutions between groups will result in disciplinary action. All code/solution should be written by you and your teammate. Both team members should contribute (almost) equally to the project.

You are allowed to use AI tools in your projects, provided that their use is clearly acknowledged in a separate section entitled “Use of AI Tools” in your project report. You must specify which tools were used, how they were used, and (if so) how these tools helped you obtain a better solution.

AI tools may be consulted as collaborators or assistants. However, projects must not be entirely produced by AI and should primarily reflect your own work and understanding. You are fully responsible for the content of your submissions.

Please refer to the syllabus for details.