-- ============================================================
-- TransferDB - Schema (Updated for Project 2)
-- CMPE 321, Spring 2026
-- ============================================================

CREATE DATABASE IF NOT EXISTS TransferDB;
USE TransferDB;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Match_Participation;
DROP TABLE IF EXISTS `Match`;
DROP TABLE IF EXISTS Club_Competition_Participation;
DROP TABLE IF EXISTS TransferRecord;
DROP TABLE IF EXISTS LoanContract;
DROP TABLE IF EXISTS PermanentContract;
DROP TABLE IF EXISTS Contract;
DROP TABLE IF EXISTS Leads;
DROP TABLE IF EXISTS Referee;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS Competition;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS DatabaseManager;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- DatabaseManager
-- ============================================================
CREATE TABLE DatabaseManager (
    db_manager_id INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

-- ============================================================
-- 1. Person
-- ============================================================
CREATE TABLE Person (
    person_ID     INT          PRIMARY KEY,
    username      VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    name          VARCHAR(100) NOT NULL,
    surname       VARCHAR(100) NOT NULL,
    nationality   VARCHAR(100) NOT NULL,
    date_of_birth DATE         NOT NULL,
    CHECK (CHAR_LENGTH(TRIM(name))        > 0),
    CHECK (CHAR_LENGTH(TRIM(surname))     > 0),
    CHECK (CHAR_LENGTH(TRIM(nationality)) > 0)
);

-- ============================================================
-- 2. Player (ISA Person)
-- ============================================================
CREATE TABLE Player (
    person_ID     INT PRIMARY KEY,
    market_value  DECIMAL(15,2) NOT NULL,
    main_position ENUM('Goalkeeper','Defender','Midfielder','Forward') NOT NULL,
    strong_foot   ENUM('Right','Left','Both') NOT NULL,
    height_cm     INT NOT NULL,
    FOREIGN KEY (person_ID) REFERENCES Person(person_ID),
    CHECK (market_value > 0),
    CHECK (height_cm    > 0)
);

-- ============================================================
-- 3. Manager (ISA Person)
-- ============================================================
CREATE TABLE Manager (
    person_ID           INT PRIMARY KEY,
    preferred_formation VARCHAR(20) NOT NULL,
    experience_level    VARCHAR(50) NOT NULL,
    FOREIGN KEY (person_ID) REFERENCES Person(person_ID),
    CHECK (CHAR_LENGTH(TRIM(preferred_formation)) > 0),
    CHECK (CHAR_LENGTH(TRIM(experience_level))    > 0)
);

-- ============================================================
-- 4. Referee (ISA Person)
-- ============================================================
CREATE TABLE Referee (
    person_ID        INT PRIMARY KEY,
    license_level    VARCHAR(50) NOT NULL,
    years_experience INT         NOT NULL,
    FOREIGN KEY (person_ID) REFERENCES Person(person_ID),
    CHECK (years_experience >= 0),
    CHECK (CHAR_LENGTH(TRIM(license_level)) > 0)
);

-- ============================================================
-- 5. Stadium
-- ============================================================
CREATE TABLE Stadium (
    stadium_ID   INT          PRIMARY KEY,
    stadium_name VARCHAR(150) NOT NULL,
    city         VARCHAR(100) NOT NULL,
    capacity     INT          NOT NULL,
    UNIQUE (stadium_name, city),
    CHECK (CHAR_LENGTH(TRIM(stadium_name)) > 0),
    CHECK (CHAR_LENGTH(TRIM(city))         > 0),
    CHECK (capacity > 0)
);

-- ============================================================
-- 6. Club
-- ============================================================
CREATE TABLE Club (
    club_ID         INT          PRIMARY KEY,
    club_name       VARCHAR(150) NOT NULL UNIQUE,
    stadium_ID      INT          NOT NULL,
    city            VARCHAR(100) NULL,
    foundation_year INT          NOT NULL,
    FOREIGN KEY (stadium_ID) REFERENCES Stadium(stadium_ID),
    CHECK (CHAR_LENGTH(TRIM(club_name)) > 0)
);

-- ============================================================
-- 7. Leads (Manager <-> Club)
-- ============================================================
CREATE TABLE Leads (
    club_ID    INT  NOT NULL,
    manager_ID INT  NOT NULL,
    start_date DATE NOT NULL,
    end_date   DATE NULL,
    PRIMARY KEY (club_ID, manager_ID, start_date),
    FOREIGN KEY (club_ID)    REFERENCES Club(club_ID),
    FOREIGN KEY (manager_ID) REFERENCES Manager(person_ID),
    CHECK (end_date IS NULL OR end_date > start_date)
);

-- ============================================================
-- 8. Contract
-- ============================================================
CREATE TABLE Contract (
    contract_id   INT  PRIMARY KEY,
    player_id     INT  NOT NULL,
    club_id       INT  NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL,
    weekly_wage   DECIMAL(15,2) NOT NULL,
    contract_type ENUM('Permanent','Loan') NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Player(person_ID),
    FOREIGN KEY (club_id)   REFERENCES Club(club_ID),
    CHECK (end_date > start_date),
    CHECK (weekly_wage > 0)
);

CREATE TABLE PermanentContract (
    contract_id INT PRIMARY KEY,
    FOREIGN KEY (contract_id) REFERENCES Contract(contract_id) ON DELETE CASCADE
);

CREATE TABLE LoanContract (
    contract_id                  INT PRIMARY KEY,
    parent_permanent_contract_id INT NOT NULL,
    FOREIGN KEY (contract_id)                  REFERENCES Contract(contract_id)         ON DELETE CASCADE,
    FOREIGN KEY (parent_permanent_contract_id) REFERENCES PermanentContract(contract_id),
    CHECK (contract_id <> parent_permanent_contract_id)
);

-- ============================================================
-- 9. Transfer Record
-- ============================================================
CREATE TABLE TransferRecord (
    transfer_id   INT  PRIMARY KEY,
    player_id     INT  NOT NULL,
    from_club_id  INT  NULL,
    to_club_id    INT  NOT NULL,
    transfer_date DATE NOT NULL,
    transfer_fee  DECIMAL(15,2) NOT NULL,
    transfer_type ENUM('Free','Purchase','Loan') NOT NULL,
    FOREIGN KEY (player_id)    REFERENCES Player(person_ID),
    FOREIGN KEY (from_club_id) REFERENCES Club(club_ID),
    FOREIGN KEY (to_club_id)   REFERENCES Club(club_ID),
    CHECK (transfer_fee >= 0),
    CHECK (
        (transfer_type = 'Free'                    AND transfer_fee = 0)
        OR
        (transfer_type IN ('Purchase','Loan') AND transfer_fee > 0)
    )
);

-- ============================================================
-- 10. Competition
-- ============================================================
CREATE TABLE Competition (
    competition_ID   INT          PRIMARY KEY,
    name             VARCHAR(150) NOT NULL,
    season           VARCHAR(20)  NOT NULL,
    country          VARCHAR(100) NOT NULL,
    competition_type ENUM('League','Cup','International') NOT NULL,
    UNIQUE (name, season),
    CHECK (CHAR_LENGTH(TRIM(name))    > 0),
    CHECK (CHAR_LENGTH(TRIM(country)) > 0)
);

-- ============================================================
-- 11. Club_Competition_Participation
-- ============================================================
CREATE TABLE Club_Competition_Participation (
    club_ID        INT NOT NULL,
    competition_ID INT NOT NULL,
    PRIMARY KEY (club_ID, competition_ID),
    FOREIGN KEY (club_ID)        REFERENCES Club(club_ID),
    FOREIGN KEY (competition_ID) REFERENCES Competition(competition_ID)
);

-- ============================================================
-- 12. Match  (`Match` is quoted — reserved keyword in MySQL)
-- ============================================================
CREATE TABLE `Match` (
    match_ID       INT     PRIMARY KEY,
    match_date     DATE    NOT NULL,
    match_time     TIME    NOT NULL,
    is_played      BOOLEAN NOT NULL DEFAULT FALSE,
    attendance     INT     NULL,
    home_goals     INT     NULL,
    away_goals     INT     NULL,
    home_club_ID   INT     NOT NULL,
    away_club_ID   INT     NOT NULL,
    referee_ID     INT     NOT NULL,
    stadium_ID     INT     NOT NULL,
    competition_ID INT     NOT NULL,
    FOREIGN KEY (home_club_ID)   REFERENCES Club(club_ID),
    FOREIGN KEY (away_club_ID)   REFERENCES Club(club_ID),
    FOREIGN KEY (referee_ID)     REFERENCES Referee(person_ID),
    FOREIGN KEY (stadium_ID)     REFERENCES Stadium(stadium_ID),
    FOREIGN KEY (competition_ID) REFERENCES Competition(competition_ID),
    CHECK (home_club_ID <> away_club_ID),
    CHECK (attendance IS NULL OR attendance >= 0),
    CHECK (home_goals IS NULL OR home_goals >= 0),
    CHECK (away_goals IS NULL OR away_goals >= 0)
);

-- ============================================================
-- 13. Match_Participation
-- ============================================================
CREATE TABLE Match_Participation (
    match_ID          INT          NOT NULL,
    player_id         INT          NOT NULL,
    club_id           INT          NOT NULL,
    is_starter        BOOLEAN      NOT NULL,
    minutes_played    INT          NOT NULL,
    position_in_match VARCHAR(30)  NOT NULL,
    goals             INT          NOT NULL DEFAULT 0,
    assists           INT          NOT NULL DEFAULT 0,
    yellow_cards      INT          NOT NULL DEFAULT 0,
    red_cards         INT          NOT NULL DEFAULT 0,
    rating            DECIMAL(4,2) NULL,
    PRIMARY KEY (match_ID, player_id),
    FOREIGN KEY (match_ID)  REFERENCES `Match`(match_ID),
    FOREIGN KEY (player_id) REFERENCES Player(person_ID),
    FOREIGN KEY (club_id)   REFERENCES Club(club_ID),
    CHECK (minutes_played >= 0 AND minutes_played <= 120),
    CHECK (goals        >= 0),
    CHECK (assists      >= 0),
    CHECK (yellow_cards >= 0 AND yellow_cards <= 2),
    CHECK (red_cards    >= 0 AND red_cards    <= 1),
    CHECK (rating IS NULL OR (rating >= 1.0 AND rating <= 10.0))
);

-- ============================================================
-- TRIGGERS
-- ============================================================

DELIMITER $$

-- Stadium: no two matches within 120 minutes
CREATE TRIGGER trg_match_stadium_conflict
BEFORE INSERT ON `Match`
FOR EACH ROW
BEGIN
    DECLARE conflict_count INT;
    SELECT COUNT(*) INTO conflict_count
    FROM `Match`
    WHERE stadium_ID = NEW.stadium_ID
      AND ABS(TIMESTAMPDIFF(MINUTE,
              TIMESTAMP(match_date, match_time),
              TIMESTAMP(NEW.match_date, NEW.match_time))) < 120;
    IF conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stadium conflict: another match is within 120 minutes at this stadium.';
    END IF;
END$$

-- Referee: no two matches within 120 minutes
CREATE TRIGGER trg_match_referee_conflict
BEFORE INSERT ON `Match`
FOR EACH ROW
BEGIN
    DECLARE conflict_count INT;
    SELECT COUNT(*) INTO conflict_count
    FROM `Match`
    WHERE referee_ID = NEW.referee_ID
      AND ABS(TIMESTAMPDIFF(MINUTE,
              TIMESTAMP(match_date, match_time),
              TIMESTAMP(NEW.match_date, NEW.match_time))) < 120;
    IF conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Referee conflict: this referee has another match within 120 minutes.';
    END IF;
END$$

-- Club: no two matches within 120 minutes
CREATE TRIGGER trg_match_club_conflict
BEFORE INSERT ON `Match`
FOR EACH ROW
BEGIN
    DECLARE conflict_count INT;
    SELECT COUNT(*) INTO conflict_count
    FROM `Match`
    WHERE (home_club_ID IN (NEW.home_club_ID, NEW.away_club_ID)
        OR away_club_ID IN (NEW.home_club_ID, NEW.away_club_ID))
      AND ABS(TIMESTAMPDIFF(MINUTE,
              TIMESTAMP(match_date, match_time),
              TIMESTAMP(NEW.match_date, NEW.match_time))) < 120;
    IF conflict_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Club conflict: a club is already scheduled within 120 minutes.';
    END IF;
END$$

-- Match must be scheduled in the future
CREATE TRIGGER trg_match_future_only
BEFORE INSERT ON `Match`
FOR EACH ROW
BEGIN
    IF TIMESTAMP(NEW.match_date, NEW.match_time) <= NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Matches must be scheduled for a future date and time.';
    END IF;
END$$

-- Max 11 starters per club per match
CREATE TRIGGER trg_max_starters
BEFORE INSERT ON Match_Participation
FOR EACH ROW
BEGIN
    DECLARE starter_count INT;
    IF NEW.is_starter = TRUE THEN
        SELECT COUNT(*) INTO starter_count
        FROM Match_Participation
        WHERE match_ID   = NEW.match_ID
          AND club_id    = NEW.club_id
          AND is_starter = TRUE;
        IF starter_count >= 11 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A club cannot have more than 11 starters in a match.';
        END IF;
    END IF;
END$$

-- Max 23 squad members per club per match
CREATE TRIGGER trg_max_squad
BEFORE INSERT ON Match_Participation
FOR EACH ROW
BEGIN
    DECLARE squad_count INT;
    SELECT COUNT(*) INTO squad_count
    FROM Match_Participation
    WHERE match_ID = NEW.match_ID
      AND club_id  = NEW.club_id;
    IF squad_count >= 23 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A club cannot have more than 23 players in a match squad.';
    END IF;
END$$

-- Manager can only lead one club at a time
CREATE TRIGGER trg_manager_one_club
BEFORE INSERT ON Leads
FOR EACH ROW
BEGIN
    DECLARE active_count INT;
    SELECT COUNT(*) INTO active_count
    FROM Leads
    WHERE manager_ID = NEW.manager_ID
      AND end_date IS NULL;
    IF active_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Manager already leads an active club. Close the previous assignment first.';
    END IF;
END$$

-- Club can only have one active manager
CREATE TRIGGER trg_club_one_manager
BEFORE INSERT ON Leads
FOR EACH ROW
BEGIN
    DECLARE active_count INT;
    SELECT COUNT(*) INTO active_count
    FROM Leads
    WHERE club_ID  = NEW.club_ID
      AND end_date IS NULL;
    IF active_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This club already has an active manager. Close the previous assignment first.';
    END IF;
END$$

-- Max 1 active Permanent + 1 active Loan contract per player
CREATE TRIGGER trg_contract_limit
BEFORE INSERT ON Contract
FOR EACH ROW
BEGIN
    DECLARE perm_count INT;
    DECLARE loan_count INT;

    IF NEW.contract_type = 'Permanent' THEN
        SELECT COUNT(*) INTO perm_count
        FROM Contract
        WHERE player_id     = NEW.player_id
          AND contract_type = 'Permanent'
          AND end_date      > CURDATE();
        IF perm_count >= 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Player already has an active Permanent contract.';
        END IF;
    END IF;

    IF NEW.contract_type = 'Loan' THEN
        SELECT COUNT(*) INTO loan_count
        FROM Contract
        WHERE player_id     = NEW.player_id
          AND contract_type = 'Loan'
          AND end_date      > CURDATE();
        IF loan_count >= 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Player already has an active Loan contract.';
        END IF;
        SELECT COUNT(*) INTO perm_count
        FROM Contract
        WHERE player_id     = NEW.player_id
          AND contract_type = 'Permanent'
          AND club_id      <> NEW.club_id
          AND end_date      > CURDATE();
        IF perm_count = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Player must have an active Permanent contract with another club to receive a Loan.';
        END IF;
    END IF;
END$$

-- Attendance cannot exceed stadium capacity
CREATE TRIGGER trg_attendance_capacity
BEFORE UPDATE ON `Match`
FOR EACH ROW
BEGIN
    DECLARE cap INT;
    IF NEW.attendance IS NOT NULL THEN
        SELECT capacity INTO cap
        FROM Stadium
        WHERE stadium_ID = NEW.stadium_ID;
        IF NEW.attendance > cap THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Attendance cannot exceed stadium capacity.';
        END IF;
    END IF;
END$$

DELIMITER ;
