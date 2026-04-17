-- ============================================================
-- TransferDB - Small Club Players & Managers
-- Gives squads to clubs 9-16, 901, 903
-- Run AFTER schema.sql, init_data.sql
-- All new users password: Mock@1234
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
-- Players for small clubs (12 per club)
-- ============================================================
-- Club 9 (rc)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14000,'rc_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','RC','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14000,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21000,14000,9,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21000);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (300,14000,NULL,9,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14001,'rc_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','RC','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14001,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21001,14001,9,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21001);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (301,14001,NULL,9,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14002,'rc_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','RC','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14002,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21002,14002,9,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21002);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (302,14002,NULL,9,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14003,'rc_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','RC','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14003,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21003,14003,9,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21003);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (303,14003,NULL,9,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14004,'rc_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','RC','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14004,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21004,14004,9,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21004);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (304,14004,NULL,9,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14005,'rc_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','RC','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14005,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21005,14005,9,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21005);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (305,14005,NULL,9,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14006,'rc_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','RC','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14006,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21006,14006,9,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21006);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (306,14006,NULL,9,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14007,'rc_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','RC','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14007,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21007,14007,9,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21007);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (307,14007,NULL,9,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14008,'rc_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','RC','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14008,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21008,14008,9,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21008);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (308,14008,NULL,9,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14009,'rc_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','RC','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14009,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21009,14009,9,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21009);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (309,14009,NULL,9,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14010,'rc_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','RC','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14010,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21010,14010,9,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21010);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (310,14010,NULL,9,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14011,'rc_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','RC','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14011,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21011,14011,9,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21011);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (311,14011,NULL,9,'2025-07-01',1200000,'Purchase');

-- Club 10 (alj)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14012,'alj_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','ALJ','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14012,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21012,14012,10,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21012);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (312,14012,NULL,10,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14013,'alj_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','ALJ','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14013,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21013,14013,10,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21013);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (313,14013,NULL,10,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14014,'alj_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','ALJ','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14014,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21014,14014,10,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21014);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (314,14014,NULL,10,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14015,'alj_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','ALJ','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14015,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21015,14015,10,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21015);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (315,14015,NULL,10,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14016,'alj_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','ALJ','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14016,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21016,14016,10,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21016);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (316,14016,NULL,10,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14017,'alj_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','ALJ','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14017,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21017,14017,10,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21017);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (317,14017,NULL,10,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14018,'alj_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','ALJ','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14018,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21018,14018,10,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21018);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (318,14018,NULL,10,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14019,'alj_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','ALJ','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14019,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21019,14019,10,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21019);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (319,14019,NULL,10,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14020,'alj_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','ALJ','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14020,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21020,14020,10,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21020);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (320,14020,NULL,10,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14021,'alj_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','ALJ','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14021,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21021,14021,10,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21021);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (321,14021,NULL,10,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14022,'alj_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','ALJ','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14022,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21022,14022,10,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21022);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (322,14022,NULL,10,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14023,'alj_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','ALJ','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14023,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21023,14023,10,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21023);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (323,14023,NULL,10,'2025-07-01',1200000,'Purchase');

-- Club 11 (glt)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14024,'glt_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','GLT','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14024,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21024,14024,11,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21024);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (324,14024,NULL,11,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14025,'glt_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','GLT','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14025,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21025,14025,11,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21025);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (325,14025,NULL,11,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14026,'glt_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','GLT','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14026,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21026,14026,11,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21026);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (326,14026,NULL,11,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14027,'glt_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','GLT','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14027,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21027,14027,11,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21027);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (327,14027,NULL,11,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14028,'glt_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','GLT','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14028,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21028,14028,11,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21028);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (328,14028,NULL,11,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14029,'glt_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','GLT','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14029,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21029,14029,11,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21029);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (329,14029,NULL,11,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14030,'glt_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','GLT','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14030,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21030,14030,11,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21030);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (330,14030,NULL,11,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14031,'glt_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','GLT','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14031,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21031,14031,11,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21031);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (331,14031,NULL,11,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14032,'glt_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','GLT','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14032,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21032,14032,11,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21032);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (332,14032,NULL,11,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14033,'glt_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','GLT','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14033,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21033,14033,11,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21033);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (333,14033,NULL,11,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14034,'glt_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','GLT','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14034,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21034,14034,11,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21034);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (334,14034,NULL,11,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14035,'glt_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','GLT','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14035,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21035,14035,11,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21035);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (335,14035,NULL,11,'2025-07-01',1200000,'Purchase');

-- Club 12 (cat)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14036,'cat_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','CAT','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14036,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21036,14036,12,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21036);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (336,14036,NULL,12,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14037,'cat_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','CAT','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14037,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21037,14037,12,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21037);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (337,14037,NULL,12,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14038,'cat_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','CAT','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14038,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21038,14038,12,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21038);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (338,14038,NULL,12,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14039,'cat_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','CAT','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14039,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21039,14039,12,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21039);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (339,14039,NULL,12,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14040,'cat_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','CAT','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14040,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21040,14040,12,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21040);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (340,14040,NULL,12,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14041,'cat_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','CAT','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14041,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21041,14041,12,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21041);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (341,14041,NULL,12,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14042,'cat_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','CAT','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14042,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21042,14042,12,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21042);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (342,14042,NULL,12,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14043,'cat_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','CAT','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14043,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21043,14043,12,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21043);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (343,14043,NULL,12,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14044,'cat_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','CAT','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14044,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21044,14044,12,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21044);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (344,14044,NULL,12,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14045,'cat_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','CAT','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14045,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21045,14045,12,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21045);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (345,14045,NULL,12,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14046,'cat_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','CAT','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14046,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21046,14046,12,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21046);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (346,14046,NULL,12,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14047,'cat_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','CAT','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14047,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21047,14047,12,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21047);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (347,14047,NULL,12,'2025-07-01',1200000,'Purchase');

-- Club 13 (pps)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14048,'pps_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','PPS','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14048,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21048,14048,13,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21048);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (348,14048,NULL,13,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14049,'pps_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','PPS','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14049,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21049,14049,13,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21049);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (349,14049,NULL,13,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14050,'pps_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','PPS','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14050,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21050,14050,13,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21050);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (350,14050,NULL,13,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14051,'pps_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','PPS','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14051,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21051,14051,13,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21051);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (351,14051,NULL,13,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14052,'pps_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','PPS','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14052,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21052,14052,13,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21052);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (352,14052,NULL,13,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14053,'pps_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','PPS','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14053,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21053,14053,13,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21053);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (353,14053,NULL,13,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14054,'pps_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','PPS','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14054,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21054,14054,13,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21054);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (354,14054,NULL,13,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14055,'pps_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','PPS','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14055,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21055,14055,13,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21055);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (355,14055,NULL,13,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14056,'pps_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','PPS','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14056,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21056,14056,13,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21056);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (356,14056,NULL,13,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14057,'pps_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','PPS','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14057,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21057,14057,13,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21057);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (357,14057,NULL,13,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14058,'pps_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','PPS','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14058,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21058,14058,13,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21058);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (358,14058,NULL,13,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14059,'pps_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','PPS','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14059,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21059,14059,13,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21059);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (359,14059,NULL,13,'2025-07-01',1200000,'Purchase');

-- Club 14 (prc)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14060,'prc_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','PRC','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14060,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21060,14060,14,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21060);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (360,14060,NULL,14,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14061,'prc_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','PRC','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14061,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21061,14061,14,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21061);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (361,14061,NULL,14,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14062,'prc_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','PRC','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14062,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21062,14062,14,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21062);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (362,14062,NULL,14,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14063,'prc_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','PRC','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14063,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21063,14063,14,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21063);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (363,14063,NULL,14,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14064,'prc_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','PRC','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14064,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21064,14064,14,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21064);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (364,14064,NULL,14,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14065,'prc_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','PRC','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14065,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21065,14065,14,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21065);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (365,14065,NULL,14,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14066,'prc_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','PRC','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14066,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21066,14066,14,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21066);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (366,14066,NULL,14,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14067,'prc_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','PRC','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14067,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21067,14067,14,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21067);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (367,14067,NULL,14,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14068,'prc_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','PRC','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14068,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21068,14068,14,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21068);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (368,14068,NULL,14,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14069,'prc_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','PRC','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14069,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21069,14069,14,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21069);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (369,14069,NULL,14,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14070,'prc_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','PRC','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14070,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21070,14070,14,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21070);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (370,14070,NULL,14,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14071,'prc_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','PRC','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14071,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21071,14071,14,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21071);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (371,14071,NULL,14,'2025-07-01',1200000,'Purchase');

-- Club 15 (crn)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14072,'crn_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','CRN','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14072,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21072,14072,15,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21072);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (372,14072,NULL,15,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14073,'crn_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','CRN','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14073,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21073,14073,15,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21073);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (373,14073,NULL,15,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14074,'crn_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','CRN','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14074,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21074,14074,15,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21074);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (374,14074,NULL,15,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14075,'crn_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','CRN','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14075,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21075,14075,15,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21075);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (375,14075,NULL,15,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14076,'crn_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','CRN','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14076,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21076,14076,15,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21076);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (376,14076,NULL,15,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14077,'crn_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','CRN','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14077,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21077,14077,15,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21077);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (377,14077,NULL,15,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14078,'crn_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','CRN','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14078,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21078,14078,15,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21078);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (378,14078,NULL,15,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14079,'crn_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','CRN','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14079,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21079,14079,15,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21079);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (379,14079,NULL,15,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14080,'crn_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','CRN','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14080,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21080,14080,15,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21080);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (380,14080,NULL,15,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14081,'crn_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','CRN','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14081,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21081,14081,15,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21081);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (381,14081,NULL,15,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14082,'crn_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','CRN','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14082,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21082,14082,15,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21082);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (382,14082,NULL,15,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14083,'crn_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','CRN','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14083,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21083,14083,15,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21083);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (383,14083,NULL,15,'2025-07-01',1200000,'Purchase');

-- Club 16 (seb)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14084,'seb_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','SEB','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14084,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21084,14084,16,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21084);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (384,14084,NULL,16,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14085,'seb_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','SEB','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14085,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21085,14085,16,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21085);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (385,14085,NULL,16,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14086,'seb_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','SEB','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14086,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21086,14086,16,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21086);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (386,14086,NULL,16,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14087,'seb_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','SEB','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14087,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21087,14087,16,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21087);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (387,14087,NULL,16,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14088,'seb_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','SEB','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14088,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21088,14088,16,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21088);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (388,14088,NULL,16,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14089,'seb_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','SEB','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14089,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21089,14089,16,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21089);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (389,14089,NULL,16,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14090,'seb_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','SEB','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14090,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21090,14090,16,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21090);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (390,14090,NULL,16,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14091,'seb_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','SEB','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14091,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21091,14091,16,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21091);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (391,14091,NULL,16,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14092,'seb_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','SEB','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14092,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21092,14092,16,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21092);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (392,14092,NULL,16,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14093,'seb_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','SEB','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14093,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21093,14093,16,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21093);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (393,14093,NULL,16,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14094,'seb_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','SEB','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14094,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21094,14094,16,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21094);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (394,14094,NULL,16,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14095,'seb_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','SEB','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14095,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21095,14095,16,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21095);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (395,14095,NULL,16,'2025-07-01',1200000,'Purchase');

-- Club 901 (tca)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14096,'tca_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','TCA','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14096,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21096,14096,901,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21096);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (396,14096,NULL,901,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14097,'tca_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','TCA','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14097,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21097,14097,901,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21097);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (397,14097,NULL,901,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14098,'tca_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','TCA','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14098,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21098,14098,901,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21098);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (398,14098,NULL,901,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14099,'tca_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','TCA','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14099,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21099,14099,901,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21099);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (399,14099,NULL,901,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14100,'tca_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','TCA','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14100,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21100,14100,901,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21100);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (400,14100,NULL,901,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14101,'tca_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','TCA','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14101,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21101,14101,901,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21101);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (401,14101,NULL,901,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14102,'tca_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','TCA','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14102,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21102,14102,901,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21102);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (402,14102,NULL,901,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14103,'tca_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','TCA','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14103,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21103,14103,901,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21103);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (403,14103,NULL,901,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14104,'tca_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','TCA','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14104,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21104,14104,901,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21104);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (404,14104,NULL,901,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14105,'tca_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','TCA','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14105,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21105,14105,901,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21105);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (405,14105,NULL,901,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14106,'tca_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','TCA','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14106,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21106,14106,901,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21106);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (406,14106,NULL,901,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14107,'tca_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','TCA','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14107,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21107,14107,901,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21107);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (407,14107,NULL,901,'2025-07-01',1200000,'Purchase');

-- Club 903 (tcc)
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14108,'tcc_p1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player1','TCC','Turkish','1990-01-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14108,800000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21108,14108,903,'2025-07-01','2028-06-30',80000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21108);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (408,14108,NULL,903,'2025-07-01',800000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14109,'tcc_p2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player2','TCC','Spanish','1991-02-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14109,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21109,14109,903,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21109);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (409,14109,NULL,903,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14110,'tcc_p3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player3','TCC','Brazilian','1992-03-03');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14110,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21110,14110,903,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21110);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (410,14110,NULL,903,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14111,'tcc_p4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player4','TCC','French','1993-04-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14111,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21111,14111,903,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21111);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (411,14111,NULL,903,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14112,'tcc_p5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player5','TCC','German','1994-05-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14112,1000000,'Defender','Right',184);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21112,14112,903,'2025-07-01','2028-06-30',100000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21112);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (412,14112,NULL,903,'2025-07-01',1000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14113,'tcc_p6','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player6','TCC','Italian','1995-06-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14113,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21113,14113,903,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21113);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (413,14113,NULL,903,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14114,'tcc_p7','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player7','TCC','Dutch','1996-07-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14114,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21114,14114,903,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21114);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (414,14114,NULL,903,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14115,'tcc_p8','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player8','TCC','Portuguese','1997-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14115,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21115,14115,903,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21115);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (415,14115,NULL,903,'2025-07-01',1200000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14116,'tcc_p9','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player9','TCC','English','1998-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14116,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21116,14116,903,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21116);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (416,14116,NULL,903,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14117,'tcc_p10','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player10','TCC','Argentine','1999-01-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14117,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21117,14117,903,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21117);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (417,14117,NULL,903,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14118,'tcc_p11','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player11','TCC','Belgian','2000-02-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14118,1500000,'Forward','Right',177);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21118,14118,903,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21118);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (418,14118,NULL,903,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (14119,'tcc_p12','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Player12','TCC','Croatian','2001-03-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (14119,1200000,'Midfielder','Right',179);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (21119,14119,903,'2025-07-01','2028-06-30',120000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (21119);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (419,14119,NULL,903,'2025-07-01',1200000,'Purchase');

-- ============================================================
-- Managers for unmanaged small clubs
-- (club 10 already has test_manager1, club 902 has mgr_test_2)
-- ============================================================
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15000,'mgr_rc','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ricardo','Callejon','Spanish','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15000,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (9,15000,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15001,'mgr_glt','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Gianluigi','Galtza','Italian','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15001,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (11,15001,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15002,'mgr_cat','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Catano','Palermo','Italian','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15002,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (12,15002,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15003,'mgr_pps','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Peter','Papadopoulos','Greek','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15003,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (13,15003,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15004,'mgr_prc','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Paolo','Parco','Italian','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15004,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (14,15004,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15005,'mgr_crn','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Carlo','Carini','Italian','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15005,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (15,15005,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15006,'mgr_seb','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Sebastian','Degage','French','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15006,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (16,15006,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15007,'mgr_tca','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Thomas','Alpha','English','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15007,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (901,15007,'2025-07-01',NULL);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (15008,'mgr_tcc','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Timothy','Charlie','English','1975-06-15');
INSERT IGNORE INTO Manager (person_ID,preferred_formation,experience_level) VALUES (15008,'4-4-2','Intermediate');
INSERT IGNORE INTO Leads (club_ID,manager_ID,start_date,end_date) VALUES (903,15008,'2025-07-01',NULL);

-- ============================================================
-- Extra referees with valid passwords
-- ============================================================
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (16001,'ref_pierluigi','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Pierluigi','Collina','Italian','1960-02-13');
INSERT IGNORE INTO Referee (person_ID,license_level,years_experience) VALUES (16001,'FIFA Pro',5);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (16002,'ref_howard','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Howard','Webb','English','1971-07-14');
INSERT IGNORE INTO Referee (person_ID,license_level,years_experience) VALUES (16002,'FIFA Pro',3);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (16003,'ref_felix','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Felix','Brych','German','1975-08-03');
INSERT IGNORE INTO Referee (person_ID,license_level,years_experience) VALUES (16003,'UEFA Elite',4);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (16004,'ref_daniele','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Daniele','Orsato','Italian','1975-12-31');
INSERT IGNORE INTO Referee (person_ID,license_level,years_experience) VALUES (16004,'UEFA Elite',4);
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (16005,'ref_bjorn','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Bjorn','Kuipers','Dutch','1973-03-28');
INSERT IGNORE INTO Referee (person_ID,license_level,years_experience) VALUES (16005,'UEFA Elite',3);

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

-- Done! All new users password: Mock@1234
-- New managers: mgr_rc, mgr_glt, mgr_cat, mgr_pps, mgr_prc, mgr_crn, mgr_seb, mgr_tca, mgr_tcc
-- New referees: ref_pierluigi, ref_howard, ref_felix, ref_daniele, ref_bjorn