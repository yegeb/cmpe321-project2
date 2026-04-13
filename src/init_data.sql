-- ============================================================
-- TransferDB - Initial Data Load
-- Run AFTER schema.sql
-- ============================================================
USE TransferDB;

-- Drop triggers that block historical data loading.
-- They are recreated at the bottom of this file.
DROP TRIGGER IF EXISTS trg_match_future_only;
DROP TRIGGER IF EXISTS trg_match_stadium_conflict;
DROP TRIGGER IF EXISTS trg_match_referee_conflict;
DROP TRIGGER IF EXISTS trg_match_club_conflict;
DROP TRIGGER IF EXISTS trg_contract_limit;
DROP TRIGGER IF EXISTS trg_match_result_timing;
DROP TRIGGER IF EXISTS trg_match_result_completeness;
DROP TRIGGER IF EXISTS trg_match_participation_active_contract;
DROP TRIGGER IF EXISTS trg_match_participation_loan_parent_block;
DROP TRIGGER IF EXISTS trg_match_played_requires_full_squads;

-- ============================================================
-- DatabaseManagers
-- ============================================================
INSERT INTO DatabaseManager (db_manager_id, username, password_hash) VALUES
(1, 'admin',  'admin'),
(2, 'kevin',  'K3v!n#2024'),
(3, 'bob',    'Bob@Secure88'),
(4, 'admin1', '326593');

-- ============================================================
-- Stadiums
-- ============================================================
INSERT INTO Stadium (stadium_ID, stadium_name, city, capacity) VALUES
(1,  'Etihad Stadium',          'Manchester', 53400),
(2,  'Ülker Stadyumu',          'Istanbul',   50530),
(3,  'RAMS Park',               'Istanbul',   52280),
(4,  'Tüpraş Stadyumu',         'Istanbul',   42590),
(5,  'Anfield',                 'Liverpool',  61276),
(6,  'Mersin Stadyumu',         'Mersin',     25534),
(7,  'Atatürk Olympic Stadium', 'Istanbul',   74753),
(8,  'Gürsel Aksel Stadium',    'Izmir',      20035),
(9,  'Papara Park',             'Trabzon',    40782),
(10, 'Corendon Airlines Park',  'Antalya',    32537),
(11, 'Eryaman Stadium',         'Ankara',     22000),
(12, 'Liberty Stadium',         'Swansea',    20532);

-- ============================================================
-- Clubs
-- ============================================================
INSERT INTO Club (club_ID, club_name, foundation_year, stadium_ID, city) VALUES
(1,  'Galatasaray SK',    1905, 3,  'Istanbul'),
(2,  'Fenerbahçe SK',     1907, 2,  'Istanbul'),
(3,  'Beşiktaş JK',       1903, 4,  'Istanbul'),
(4,  'Manchester City FC',1880, 1,  'Manchester'),
(5,  'Liverpool FC',      1892, 5,  'Liverpool'),
(6,  'Trabzonspor',       1967, 9,  'Trabzon'),
(7,  'Hatayspor',         1967, 6,  'Mersin'),
(8,  'YENIDEN DOGUS',     2025, 12, 'Swansea'),
(9,  'Real Callejon',     2020, 12, NULL),
(10, 'ALJANDAL FC',       2020, 12, NULL),
(11, 'Galtza CF',         2020, 12, NULL),
(12, 'Catania FCA',       2020, 12, NULL),
(13, 'FC PPS',            2020, 12, NULL),
(14, 'Parco FCI',         2020, 12, NULL),
(15, 'Carini FC',         1999, 12, NULL),
(16, 'seb degage',        1977, 12, NULL);

-- ============================================================
-- Competitions
-- ============================================================
INSERT INTO Competition (competition_ID, name, season, country, competition_type) VALUES
(1,  'Super Lig',        '2025/2026', 'Türkiye', 'League'),
(2,  'Türkiye Kupasi',   '2025/2026', 'Türkiye', 'Cup'),
(3,  'Premier League',   '2025/2026', 'England', 'League'),
(4,  'FA Cup',           '2025/2026', 'England', 'Cup'),
(5,  'UEFA Champions League', '2025/2026', 'Europe', 'International'),
(6,  'UEFA Europa League',    '2025/2026', 'Europe', 'International'),
(7,  'UEFA Conference League','2025/2026', 'Europe', 'International'),
(8,  'Trendyol Super Lig',   '2024/2025', 'Türkiye', 'League'),
(9,  'Test League A',         '2025/2026', 'Unknown', 'League'),
(10, 'Test Cup B',            '2025/2026', 'Unknown', 'Cup');

-- ============================================================
-- Persons: Players
-- ============================================================
INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES
(1,  'burak_yilmaz',     'hash_Str0ng!1',  'Burak',    'Yilmaz',      'Türkiye',  '1985-07-15'),
(2,  'arda_guler',       'hash_Str0ng!2',  'Arda',     'Guler',       'Türkiye',  '2005-02-25'),
(3,  'gedson_fernandes', 'hash_Str0ng!3',  'Gedson',   'Fernandes',   'Portugal', '1999-01-09'),
(4,  'fernando_muslera', 'hash_Str0ng!4',  'Fernando', 'Muslera',     'Uruguay',  '1986-06-16'),
(5,  'altay_bayindir',   'hash_1',         'Altay',    'Bayindir',    'Türkiye',  '1998-04-14'),
(6,  'ferdi_kadioglu',   'hash_2',         'Ferdi',    'Kadioglu',    'Türkiye',  '1999-10-07'),
(7,  'caglar_soyuncu',   'hash_3',         'Caglar',   'Soyuncu',     'Türkiye',  '1996-05-23'),
(8,  'ozan_kabak',       'hash_4',         'Ozan',     'Kabak',       'Türkiye',  '2000-03-25'),
(9,  'salih_ozcan',      'hash_5',         'Salih',    'Ozcan',       'Türkiye',  '1998-01-11'),
(10, 'hakan_calhanoglu', 'hash_6',         'Hakan',    'Calhanoglu',  'Türkiye',  '1994-02-08'),
(11, 'orkun_kokcu',      'hash_7',         'Orkun',    'Kokcu',       'Türkiye',  '2000-12-29'),
(12, 'kerem_akturkoglu', 'hash_8',         'Kerem',    'Akturkoglu',  'Türkiye',  '1998-10-21'),
(13, 'baris_yilmaz',     'hash_9',         'Baris',    'Yilmaz',      'Türkiye',  '2000-05-23'),
(14, 'enes_unal',        'hash_10',        'Enes',     'Unal',        'Türkiye',  '1997-05-10'),
(15, 'cengiz_under',     'hash_11',        'Cengiz',   'Under',       'Türkiye',  '1997-07-14'),
(16, 'arzgr222',         'arzgr222',       'Abdullah', 'Rüzgar',      'Türkiye',  '2003-06-26'),
(17, 'berkgkts',         'berkgkts',       'Berk',     'Göktaş',      'Türkiye',  '2004-01-01'),
(18, 'b_ayd23',          'b_ayd23',        'Poyraz',   'Güneşçelik',  'Türkiye',  '2003-12-12');

INSERT INTO Player (person_ID, market_value, main_position, strong_foot, height_cm) VALUES
(1,  500000,     'Forward',    'Right', 188),
(2,  30000000,   'Midfielder', 'Left',  175),
(3,  15000000,   'Midfielder', 'Right', 181),
(4,  1000000,    'Goalkeeper', 'Right', 190),
(5,  10000000,   'Goalkeeper', 'Right', 198),
(6,  20000000,   'Defender',   'Right', 174),
(7,  15000000,   'Defender',   'Right', 185),
(8,  12000000,   'Defender',   'Right', 186),
(9,  13000000,   'Midfielder', 'Right', 182),
(10, 35000000,   'Midfielder', 'Right', 178),
(11, 30000000,   'Midfielder', 'Right', 175),
(12, 18000000,   'Forward',    'Right', 173),
(13, 15000000,   'Forward',    'Right', 186),
(14, 25000000,   'Forward',    'Right', 187),
(15, 16000000,   'Forward',    'Left',  173),
(16, 185000000,  'Forward',    'Both',  183),
(17, 78000000,   'Forward',    'Right', 178),
(18, 123000000,  'Midfielder', 'Right', 177);

-- ============================================================
-- Persons: Managers
-- ============================================================
INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES
(2001, 'fatih_terim',    'hash_M@nager1', 'Fatih',   'Terim',     'Türkiye',  '1953-09-04'),
(2002, 'jorge_jesus',    'hash_M@nager2', 'Jorge',   'Jesus',     'Portugal', '1954-07-24'),
(2003, 'ismail_kartal',  'hash_M3',       'Ismail',  'Kartal',    'Türkiye',  '1961-05-25'),
(2004, 'pep_guardiola',  'hash_M4',       'Pep',     'Guardiola', 'Spain',    '1971-01-18'),
(2005, 'jurgen_klopp',   'hash_M5',       'Jurgen',  'Klopp',     'Germany',  '1967-06-16'),
(2006, 'sergen_yalcin',  'hash_M6',       'Sergen',  'Yalcin',    'Türkiye',  '1972-10-05'),
(2007, 'okan_buruk',     'hash_M7',       'Okan',    'Buruk',     'Türkiye',  '1973-10-19'),
(2008, 'jose_mourinho',  'hash_M8',       'Jose',    'Mourinho',  'Portugal', '1963-01-26'),
(2009, 'volkan_demirel', 'hash_M9',       'Volkan',  'Demirel',   'Türkiye',  '1981-10-27'),
(2010, 'clubs_coach',    'coach123',      'Anonymus','Coach',      'Zimbabve', '2000-01-01');

INSERT INTO Manager (person_ID, preferred_formation, experience_level) VALUES
(2001, '4-4-2',   'Expert'),
(2002, '4-1-3-2', 'Expert'),
(2003, '4-2-3-1', 'Advanced'),
(2004, '4-3-3',   'Expert'),
(2005, '4-3-3',   'Expert'),
(2006, '4-2-3-1', 'Advanced'),
(2007, '4-2-3-1', 'Advanced'),
(2008, '4-2-3-1', 'Expert'),
(2009, '4-2-3-1', 'Intermediate'),
(2010, '4-3-3',   'Intermediate');

-- ============================================================
-- Persons: Referees
-- ============================================================
INSERT INTO Person (person_ID, username, password_hash, name, surname, nationality, date_of_birth) VALUES
(1001, 'cuneyt_cakir',       'hash_R3feree!',  'Cuneyt',   'Cakir',      'Türkiye', '1976-11-23'),
(1002, 'halil_meler',        'hash_R3feree2',  'Halil',    'Meler',      'Türkiye', '1986-08-01'),
(1003, 'michael_oliver',     'hash_Ref03',     'Michael',  'Oliver',     'England', '1985-02-20'),
(1004, 'anthony_taylor',     'hash_Ref04',     'Anthony',  'Taylor',     'England', '1978-10-20'),
(1005, 'szymon_marciniak',   'hash_Ref05',     'Szymon',   'Marciniak',  'Poland',  '1981-01-07'),
(1006, 'stephanie_frappart', 'hash_Ref06',     'Stephanie','Frappart',   'France',  '1983-12-14'),
(1007, 'ali_palabiyik',      'hash_Ref07',     'Ali',      'Palabiyik',  'Türkiye', '1981-08-14');

INSERT INTO Referee (person_ID, license_level, years_experience) VALUES
(1001, 'FIFA',        20),
(1002, 'FIFA',        10),
(1003, 'UEFA Elite',  15),
(1004, 'UEFA Elite',  18),
(1005, 'FIFA',        14),
(1006, 'FIFA',        12),
(1007, 'National',    12);

-- ============================================================
-- Leads (Manager -> Club assignments)
-- ============================================================
INSERT INTO Leads (club_ID, manager_ID, start_date, end_date) VALUES
(1, 2007, '2023-07-01', NULL),
(2, 2008, '2023-07-01', NULL),
(3, 2006, '2022-07-01', NULL),
(4, 2004, '2023-07-01', NULL),
(5, 2005, '2023-07-01', NULL),
(6, 2001, '2023-07-01', NULL),
(7, 2009, '2024-01-01', NULL),
(8, 2010, '2025-07-01', NULL);

-- ============================================================
-- Contracts
-- Notes:
--   Contract 1 ended 2025-07-31 (player 2 moved to Beşiktaş in Aug 2025).
--   Contract 11 is historical (expired 2022).
--   No Loan contracts in seed data — the feature works, just no demo records.
-- ============================================================
INSERT INTO Contract (contract_id, player_id, club_id, contract_type, weekly_wage, start_date, end_date) VALUES
(1,  2,  1, 'Permanent', 50000, '2024-01-01', '2025-07-31'),  -- expired; player moved to Beşiktaş
(3,  2,  3, 'Permanent', 80000, '2025-08-01', '2029-08-01'),
(5,  5,  1, 'Permanent', 40000, '2024-07-01', '2028-06-30'),
(6,  6,  1, 'Permanent', 55000, '2023-07-01', '2027-06-30'),
(7,  7,  1, 'Permanent', 60000, '2024-01-15', '2027-06-30'),
(8,  8,  1, 'Permanent', 45000, '2024-08-01', '2028-06-30'),
(9,  9,  1, 'Permanent', 50000, '2023-08-01', '2026-06-30'),
(10, 10, 1, 'Permanent', 90000, '2022-07-01', '2026-06-30'),
(11, 10, 3, 'Permanent', 75000, '2018-07-01', '2022-06-30'),  -- historical / expired
(12, 11, 1, 'Permanent', 80000, '2024-07-01', '2029-06-30'),
(13, 12, 1, 'Permanent', 65000, '2021-07-01', '2026-06-30'),
(14, 13, 1, 'Permanent', 50000, '2022-07-01', '2027-06-30'),
(15, 14, 2, 'Permanent', 70000, '2023-07-01', '2027-06-30'),
(16, 16, 8, 'Permanent',150000, '2026-01-01', '2028-12-12'),
(17, 17, 8, 'Permanent', 99000, '2026-01-01', '2028-12-12'),
(18, 18, 8, 'Permanent',175000, '2026-02-01', '2028-12-12');

INSERT INTO PermanentContract (contract_id) VALUES
(1),(3),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18);

-- ============================================================
-- Transfer Records
-- ============================================================
INSERT INTO TransferRecord (transfer_id, player_id, from_club_id, to_club_id, transfer_date, transfer_fee, transfer_type) VALUES
(1,  10, 3, 1, '2022-07-01', 35000000, 'Purchase'),
(2,  4,  3, 1, '2023-08-01', 0,        'Free'),
(3,  2,  5, 1, '2024-01-01', 20000000, 'Purchase'),
(4,  5,  2, 1, '2024-07-01', 10000000, 'Purchase'),
(5,  1,  NULL, 4, '2025-01-01', 500000,   'Loan'),
(6,  2,  1, 2, '2025-06-01', 1500000,  'Loan'),
(7,  2,  1, 3, '2025-08-01', 30000000, 'Purchase'),
(8,  6,  2, 1, '2023-07-01', 20000000, 'Purchase'),
(9,  7,  8, 1, '2024-01-15', 15000000, 'Purchase'),
(10, 14, 1, 2, '2023-07-01', 25000000, 'Purchase'),
(11, 16, NULL, 8, '2026-01-01', 0,       'Free'),
(12, 17, NULL, 8, '2026-02-01', 0,       'Free'),
(13, 18, NULL, 8, '2026-01-01', 0,       'Free');

-- ============================================================
-- Matches
-- ============================================================
INSERT INTO `Match` (match_ID, match_date, match_time, stadium_ID, home_club_ID, away_club_ID, referee_ID, competition_ID, home_goals, away_goals, attendance, is_played) VALUES
(1,  '2026-04-15', '19:00:00', 1, 1, 2,  1001, 1, 2, 1, 40000, TRUE),
(2,  '2026-04-15', '20:00:00', 1, 3, 4,  1001, 1, NULL, NULL, NULL, FALSE),
(3,  '2025-10-10', '19:00:00', 1, 1, 3,  1002, 1, 3, 0, 44000, TRUE),
(4,  '2025-11-22', '20:00:00', 3, 3, 1,  1001, 1, 1, 1, 51000, TRUE),
(5,  '2026-05-01', '21:00:00', 4, 5, 6,  1002, 2, NULL, NULL, NULL, FALSE),
(6,  '2026-05-10', '18:00:00', 2, 2, 5,  1001, 1, NULL, NULL, 55000, FALSE),
(7,  '2026-05-15', '14:00:00', 5, 6, 7,  1002, 1, NULL, NULL, NULL, FALSE),
(8,  '2026-05-15', '15:00:00', 6, 7, 1,  1002, 1, NULL, NULL, NULL, FALSE),
(9,  '2026-03-13', '15:00:00', 12, 8, 9,  1003, 9, 1, 5, 20123, TRUE),
(10, '2026-03-13', '17:00:00', 12, 8, 10, 1004, 9, 1, 3, 19599, TRUE),
(11, '2026-03-13', '21:00:00', 12, 8, 11, 1005, 9, 4, 5, 18000, TRUE),
(12, '2026-03-13', '23:00:00', 12, 8, 12, 1003, 9, 5, 6, 20000, TRUE),
(13, '2026-03-14', '17:00:00', 12, 8, 13, 1004, 9, 3, 2, 22000, TRUE),
(14, '2026-03-12', '12:00:00', 12, 8, 14, 1002, 10, 7, 3, 22400, TRUE),
(15, '2026-03-12', '14:00:00', 12, 8, 15, 1006, 10, 6, 1, 22400, TRUE),
(16, '2026-03-10', '14:00:00', 12, 8, 16, 1005, 10, 5, 3, 21900, TRUE);

-- ============================================================
-- Match Participation
-- ============================================================
INSERT INTO Match_Participation (match_ID, player_id, club_id, is_starter, minutes_played, position_in_match, goals, assists, yellow_cards, red_cards, rating) VALUES
(1, 4,  1, TRUE, 90, 'GK',  0, 0, 0, 0, 7.5),
(1, 2,  1, TRUE, 90, 'CM',  1, 0, 0, 0, 8.2),
(1, 3,  1, TRUE, 90, 'CAM', 0, 1, 1, 0, 7.0),
(1, 1,  1, TRUE, 90, 'ST',  1, 0, 0, 0, 7.8),
(1, 14, 2, TRUE, 90, 'ST',  1, 0, 0, 0, 7.2),
(1, 15, 2, TRUE, 90, 'CF',  0, 1, 0, 0, 6.8),
(3, 10, 1, TRUE, 90, 'CDM', 1, 2, 0, 0, 9.2),
(3, 12, 1, TRUE, 85, 'LW',  2, 0, 0, 0, 8.8),
(3, 11, 1, TRUE, 90, 'RM',  0, 1, 1, 0, 7.5);

-- ============================================================
-- Club-Competition Participation (derived from matches)
-- ============================================================
INSERT IGNORE INTO Club_Competition_Participation (club_ID, competition_ID)
SELECT DISTINCT home_club_ID, competition_ID FROM `Match`
UNION
SELECT DISTINCT away_club_ID, competition_ID FROM `Match`;

-- ============================================================
-- Recreate triggers that were dropped at the top
-- ============================================================
DELIMITER $$

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

CREATE TRIGGER trg_match_future_only
BEFORE INSERT ON `Match`
FOR EACH ROW
BEGIN
    IF TIMESTAMP(NEW.match_date, NEW.match_time) <= NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Matches must be scheduled for a future date and time.';
    END IF;
END$$

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

CREATE TRIGGER trg_match_result_timing
BEFORE UPDATE ON `Match`
FOR EACH ROW
BEGIN
    IF NEW.is_played = TRUE AND OLD.is_played = FALSE
       AND TIMESTAMP(OLD.match_date, OLD.match_time) > NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Match result cannot be submitted before the scheduled kickoff time.';
    END IF;
END$$

CREATE TRIGGER trg_match_result_completeness
BEFORE UPDATE ON `Match`
FOR EACH ROW
BEGIN
    IF NEW.is_played = TRUE THEN
        IF NEW.home_goals IS NULL OR NEW.away_goals IS NULL OR NEW.attendance IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Played matches must include attendance, home goals, and away goals.';
        END IF;
    END IF;
END$$

CREATE TRIGGER trg_match_participation_active_contract
BEFORE INSERT ON Match_Participation
FOR EACH ROW
BEGIN
    DECLARE active_contracts INT;

    SELECT COUNT(*) INTO active_contracts
    FROM Contract c
    WHERE c.player_id = NEW.player_id
      AND c.club_id = NEW.club_id
      AND c.start_date <= (
          SELECT match_date FROM `Match` WHERE match_ID = NEW.match_ID
      )
      AND c.end_date >= (
          SELECT match_date FROM `Match` WHERE match_ID = NEW.match_ID
      );

    IF active_contracts = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Player must have an active contract with the selected club for that match date.';
    END IF;
END$$

CREATE TRIGGER trg_match_participation_loan_parent_block
BEFORE INSERT ON Match_Participation
FOR EACH ROW
BEGIN
    DECLARE invalid_count INT;

    SELECT COUNT(*) INTO invalid_count
    FROM Contract parent_c
    INNER JOIN PermanentContract pc ON pc.contract_id = parent_c.contract_id
    INNER JOIN LoanContract lc ON lc.parent_permanent_contract_id = pc.contract_id
    INNER JOIN Contract loan_c ON loan_c.contract_id = lc.contract_id
    INNER JOIN `Match` m ON m.match_ID = NEW.match_ID
    WHERE parent_c.player_id = NEW.player_id
      AND parent_c.club_id = NEW.club_id
      AND loan_c.player_id = NEW.player_id
      AND m.match_date BETWEEN loan_c.start_date AND loan_c.end_date;

    IF invalid_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A loaned player cannot play for their parent club during the loan period.';
    END IF;
END$$

CREATE TRIGGER trg_match_played_requires_full_squads
BEFORE UPDATE ON `Match`
FOR EACH ROW
BEGIN
    DECLARE home_players INT;
    DECLARE away_players INT;
    DECLARE home_starters INT;
    DECLARE away_starters INT;

    IF NEW.is_played = TRUE AND OLD.is_played = FALSE THEN
        SELECT COUNT(*), COALESCE(SUM(CASE WHEN is_starter = TRUE THEN 1 ELSE 0 END), 0)
        INTO home_players, home_starters
        FROM Match_Participation
        WHERE match_ID = NEW.match_ID AND club_id = NEW.home_club_ID;

        SELECT COUNT(*), COALESCE(SUM(CASE WHEN is_starter = TRUE THEN 1 ELSE 0 END), 0)
        INTO away_players, away_starters
        FROM Match_Participation
        WHERE match_ID = NEW.match_ID AND club_id = NEW.away_club_ID;

        IF home_players < 11 OR away_players < 11 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Both clubs must have at least 11 squad members before the match can be marked as played.';
        END IF;

        IF home_players > 23 OR away_players > 23 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No club may exceed 23 squad members in a played match.';
        END IF;

        IF home_starters <> 11 OR away_starters <> 11 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Both clubs must have exactly 11 starters before the match can be marked as played.';
        END IF;
    END IF;
END$$

DELIMITER ;
