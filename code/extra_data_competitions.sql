-- ============================================================
-- TransferDB - Competition Enrollment & Played Matches
-- Enables: standings, leaderboards, player/referee stats
-- Run AFTER schema.sql, init_data.sql, extra_data.sql
-- ============================================================
USE TransferDB;

DROP TRIGGER IF EXISTS trg_match_future_only;
DROP TRIGGER IF EXISTS trg_match_stadium_conflict;
DROP TRIGGER IF EXISTS trg_match_referee_conflict;
DROP TRIGGER IF EXISTS trg_match_club_conflict;
DROP TRIGGER IF EXISTS trg_match_result_timing;
DROP TRIGGER IF EXISTS trg_match_result_completeness;
DROP TRIGGER IF EXISTS trg_match_participation_active_contract;
DROP TRIGGER IF EXISTS trg_match_participation_loan_parent_block;
DROP TRIGGER IF EXISTS trg_match_played_requires_full_squads;
DROP TRIGGER IF EXISTS trg_contract_limit;
DROP TRIGGER IF EXISTS trg_max_starters;
DROP TRIGGER IF EXISTS trg_max_squad;
DROP TRIGGER IF EXISTS trg_manager_one_club;
DROP TRIGGER IF EXISTS trg_club_one_manager;
DROP TRIGGER IF EXISTS trg_attendance_capacity;

-- ============================================================
-- Club_Competition_Participation
-- ============================================================
-- Super Lig (comp 1): Galatasaray, Fenerbahce, Besiktas, Trabzonspor, Hatayspor
INSERT IGNORE INTO Club_Competition_Participation VALUES (1,1),(2,1),(3,1),(6,1),(7,1);
-- UEFA Champions League (comp 5): Galatasaray, Man City, Liverpool
INSERT IGNORE INTO Club_Competition_Participation VALUES (1,5),(4,5),(5,5);
-- UEFA Europa League (comp 6): Fenerbahce, Liverpool
INSERT IGNORE INTO Club_Competition_Participation VALUES (2,6),(5,6);
-- UEFA Conference League (comp 7): Besiktas, Trabzonspor
INSERT IGNORE INTO Club_Competition_Participation VALUES (3,7),(6,7);
-- Premier League (comp 3): Man City, Liverpool
INSERT IGNORE INTO Club_Competition_Participation VALUES (4,3),(5,3);

-- ============================================================
-- Played matches (Super Lig 2025/2026)
-- ============================================================
-- Match 4001: 2025-09-15 home_goals=2 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4001,'2025-09-15','19:00',1,2,1,35000,1,2,1001,3,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,5,1,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,6,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,7,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,8,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,9,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,11,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,12,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10100,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10101,1,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10102,1,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10103,1,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10104,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,10105,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13000,2,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13001,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13002,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13003,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13004,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13005,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13006,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13007,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13008,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13009,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13010,2,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13011,2,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13012,2,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13013,2,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4001,13014,2,0,30,'Forward',0,0,0,0,7.0);

-- Match 4002: 2025-09-22 home_goals=1 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4002,'2025-09-22','17:00',1,1,1,35000,3,6,1002,4,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13015,3,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13016,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13017,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13018,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13019,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13020,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13021,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13022,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13023,3,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13024,3,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13025,3,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13026,3,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13027,3,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13028,3,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13029,3,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13060,6,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13061,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13062,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13063,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13064,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13065,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13066,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13067,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13068,6,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13069,6,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13070,6,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13071,6,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13072,6,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13073,6,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4002,13074,6,0,30,'Forward',0,0,0,0,7.0);

-- Match 4003: 2025-09-28 home_goals=3 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4003,'2025-09-28','19:00',1,3,0,35000,2,7,1003,2,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13000,2,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13001,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13002,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13003,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13004,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13005,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13006,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13007,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13008,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13009,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13010,2,1,90,'Forward',2,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13011,2,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13012,2,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13013,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13014,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13075,7,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13076,7,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13077,7,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13078,7,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13079,7,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13080,7,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13081,7,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13082,7,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13083,7,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13084,7,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13085,7,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13086,7,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13087,7,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13088,7,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4003,13089,7,0,30,'Forward',0,0,0,0,7.0);

-- Match 4004: 2025-10-05 home_goals=1 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4004,'2025-10-05','19:00',1,1,0,35000,1,3,1001,3,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,5,1,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,6,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,7,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,8,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,9,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,11,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,12,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10100,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10101,1,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10102,1,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10103,1,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10104,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,10105,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13015,3,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13016,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13017,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13018,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13019,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13020,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13021,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13022,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13023,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13024,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13025,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13026,3,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13027,3,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13028,3,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4004,13029,3,0,30,'Forward',0,0,0,0,7.0);

-- Match 4005: 2025-10-19 home_goals=2 away_goals=2
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4005,'2025-10-19','17:00',1,2,2,35000,6,2,1002,9,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13060,6,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13061,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13062,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13063,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13064,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13065,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13066,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13067,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13068,6,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13069,6,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13070,6,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13071,6,0,30,'Midfielder',2,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13072,6,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13073,6,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13074,6,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13000,2,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13001,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13002,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13003,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13004,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13005,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13006,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13007,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13008,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13009,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13010,2,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13011,2,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13012,2,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13013,2,0,30,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4005,13014,2,0,30,'Forward',0,0,0,0,7.0);

-- Match 4006: 2025-10-26 home_goals=0 away_goals=2
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4006,'2025-10-26','17:00',1,0,2,35000,7,1,1004,6,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13075,7,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13076,7,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13077,7,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13078,7,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13079,7,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13080,7,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13081,7,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13082,7,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13083,7,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13084,7,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13085,7,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13086,7,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13087,7,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13088,7,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13089,7,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,5,1,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,6,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,7,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,8,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,9,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,11,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,12,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,13,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10100,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10101,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10102,1,0,30,'Midfielder',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10103,1,0,30,'Defender',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10104,1,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4006,10105,1,0,30,'Forward',0,0,0,0,7.0);

-- Match 4007: 2025-11-02 home_goals=2 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4007,'2025-11-02','19:00',1,2,1,35000,3,2,1005,4,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13015,3,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13016,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13017,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13018,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13019,3,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13020,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13021,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13022,3,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13023,3,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13024,3,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13025,3,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13026,3,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13027,3,0,30,'Defender',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13028,3,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13029,3,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13000,2,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13001,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13002,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13003,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13004,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13005,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13006,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13007,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13008,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13009,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13010,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13011,2,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13012,2,0,30,'Defender',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13013,2,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4007,13014,2,0,30,'Forward',0,0,0,0,7.0);

-- Match 4008: 2025-11-09 home_goals=1 away_goals=3
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4008,'2025-11-09','19:00',1,1,3,35000,6,1,1003,9,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13060,6,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13061,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13062,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13063,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13064,6,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13065,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13066,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13067,6,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13068,6,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13069,6,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13070,6,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13071,6,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13072,6,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13073,6,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13074,6,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,5,1,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,6,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,7,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,8,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,9,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,11,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,12,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,13,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10100,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10101,1,1,90,'Forward',2,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10102,1,0,30,'Midfielder',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10103,1,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10104,1,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4008,10105,1,0,30,'Forward',0,0,0,0,7.0);

-- Match 4009: 2025-11-23 home_goals=0 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4009,'2025-11-23','19:00',1,0,0,35000,1,6,1002,3,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,5,1,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,6,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,7,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,8,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,9,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,11,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,12,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10100,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10101,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10102,1,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10103,1,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10104,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,10105,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13060,6,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13061,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13062,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13063,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13064,6,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13065,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13066,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13067,6,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13068,6,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13069,6,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13070,6,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13071,6,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13072,6,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13073,6,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4009,13074,6,0,30,'Forward',0,0,0,0,7.0);

-- Match 4010: 2025-11-30 home_goals=2 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4010,'2025-11-30','17:00',1,2,0,35000,2,3,1001,2,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13000,2,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13001,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13002,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13003,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13004,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13005,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13006,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13007,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13008,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13009,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13010,2,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13011,2,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13012,2,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13013,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13014,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13015,3,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13016,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13017,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13018,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13019,3,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13020,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13021,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13022,3,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13023,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13024,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13025,3,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13026,3,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13027,3,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13028,3,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4010,13029,3,0,30,'Forward',0,0,0,0,7.0);

-- ============================================================
-- Played matches (Champions League 2025/2026)
-- ============================================================
-- Match 4011: 2025-09-17 home_goals=1 away_goals=2
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4011,'2025-09-17','20:00',1,1,2,35000,1,4,1004,3,5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,5,1,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,6,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,7,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,8,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,9,1,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,11,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,12,1,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10100,1,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10101,1,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10102,1,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10103,1,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10104,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,10105,1,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13030,4,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13031,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13032,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13033,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13034,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13035,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13036,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13037,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13038,4,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13039,4,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13040,4,1,90,'Forward',2,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13041,4,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13042,4,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13043,4,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4011,13044,4,0,30,'Forward',0,0,0,0,7.0);

-- Match 4012: 2025-10-01 home_goals=3 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4012,'2025-10-01','20:00',1,3,1,35000,5,1,1005,5,5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13045,5,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13046,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13047,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13048,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13049,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13050,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13051,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13052,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13053,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13054,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13055,5,1,90,'Forward',2,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13056,5,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13057,5,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13058,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13059,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,5,1,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,6,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,7,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,8,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,9,1,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,11,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,12,1,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,13,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10100,1,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10101,1,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10102,1,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10103,1,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10104,1,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4012,10105,1,0,30,'Forward',0,0,0,0,7.0);

-- Match 4013: 2025-10-22 home_goals=2 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4013,'2025-10-22','20:00',1,2,0,35000,4,5,1003,1,5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13030,4,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13031,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13032,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13033,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13034,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13035,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13036,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13037,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13038,4,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13039,4,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13040,4,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13041,4,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13042,4,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13043,4,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13044,4,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13045,5,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13046,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13047,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13048,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13049,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13050,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13051,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13052,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13053,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13054,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13055,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13056,5,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13057,5,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13058,5,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4013,13059,5,0,30,'Forward',0,0,0,0,7.0);

-- ============================================================
-- Played matches (Europa League 2025/2026)
-- ============================================================
-- Match 4014: 2025-09-25 home_goals=2 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4014,'2025-09-25','18:55',1,2,1,35000,2,5,1007,2,6);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13000,2,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13001,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13002,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13003,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13004,2,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13005,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13006,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13007,2,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13008,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13009,2,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13010,2,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13011,2,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13012,2,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13013,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13014,2,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13045,5,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13046,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13047,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13048,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13049,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13050,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13051,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13052,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13053,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13054,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13055,5,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13056,5,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13057,5,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13058,5,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4014,13059,5,0,30,'Forward',0,0,0,0,7.0);

-- Match 4015: 2025-10-03 home_goals=1 away_goals=0
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4015,'2025-10-03','18:55',1,1,0,35000,5,2,1006,5,6);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13045,5,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13046,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13047,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13048,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13049,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13050,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13051,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13052,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13053,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13054,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13055,5,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13056,5,0,30,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13057,5,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13058,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13059,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13000,2,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13001,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13002,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13003,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13004,2,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13005,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13006,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13007,2,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13008,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13009,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13010,2,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13011,2,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13012,2,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13013,2,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4015,13014,2,0,30,'Forward',0,0,0,0,7.0);

-- ============================================================
-- Played matches (Premier League 2025/2026)
-- ============================================================
-- Match 4016: 2025-09-21 home_goals=3 away_goals=1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4016,'2025-09-21','16:30',1,3,1,35000,4,5,1004,1,3);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13030,4,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13031,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13032,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13033,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13034,4,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13035,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13036,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13037,4,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13038,4,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13039,4,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13040,4,1,90,'Forward',2,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13041,4,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13042,4,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13043,4,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13044,4,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13045,5,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13046,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13047,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13048,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13049,5,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13050,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13051,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13052,5,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13053,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13054,5,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13055,5,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13056,5,0,30,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13057,5,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13058,5,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4016,13059,5,0,30,'Forward',0,0,0,0,7.0);

-- Match 4017: 2025-10-26 home_goals=2 away_goals=2
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_goals,away_goals,attendance,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (4017,'2025-10-26','16:30',1,2,2,35000,5,4,1002,5,3);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13045,5,1,90,'Goalkeeper',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13046,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13047,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13048,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13049,5,1,90,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13050,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13051,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13052,5,1,90,'Midfielder',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13053,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13054,5,1,90,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13055,5,1,90,'Forward',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13056,5,0,30,'Midfielder',1,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13057,5,0,30,'Defender',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13058,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13059,5,0,30,'Forward',0,0,0,0,7.5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13030,4,1,90,'Goalkeeper',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13031,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13032,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13033,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13034,4,1,90,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13035,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13036,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13037,4,1,90,'Midfielder',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13038,4,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13039,4,1,90,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13040,4,1,90,'Forward',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13041,4,0,30,'Midfielder',1,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13042,4,0,30,'Defender',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13043,4,0,30,'Forward',0,0,0,0,7.0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards,rating) VALUES (4017,13044,4,0,30,'Forward',0,0,0,0,7.0);

-- ============================================================
-- Recreate triggers
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

-- A played match must be submitted only after its scheduled kickoff time
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

-- A played match must have a complete result payload
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

-- A player may only be added for a club they are actively contracted to
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

-- A loaned player cannot appear for their parent club during the loan period
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

-- A match cannot be marked as played unless both clubs have valid squad sizes
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

-- Done! Standings, leaderboards, and stats are now populated.