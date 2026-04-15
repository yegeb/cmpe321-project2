-- ============================================================
-- TransferDB - Extra Mock Data
-- Run AFTER schema.sql and init_data.sql
-- All new users have password: Mock@1234
-- ============================================================
USE TransferDB;

-- Drop triggers that block historical data loading
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
-- Persons + Players (15 per club)
-- Clubs: 2=Fenerbahçe, 3=Beşiktaş, 4=ManCity, 5=Liverpool, 6=Trabzonspor, 7=Hatayspor
-- ============================================================
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13000,'fb_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Altay','Bayindir2','Turkish','1999-04-29');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13000,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20000,13000,2,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20000);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (200,13000,NULL,2,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13001,'fb_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Dominik','Livakovic','Croatian','1995-01-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13001,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20001,13001,2,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20001);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (201,13001,NULL,2,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13002,'fb_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Bright','Osayi','Nigerian','1998-04-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13002,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20002,13002,2,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20002);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (202,13002,NULL,2,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13003,'fb_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Jayden','Oosterwolde','Dutch','2001-04-23');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13003,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20003,13003,2,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20003);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (203,13003,NULL,2,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13004,'fb_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Yusuf','Akchurch','Turkish','2000-06-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13004,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20004,13004,2,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20004);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (204,13004,NULL,2,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13005,'fb_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Alexander','Djiku','Ghanaian','1994-08-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13005,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20005,13005,2,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20005);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (205,13005,NULL,2,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13006,'fb_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ismail','Yuksek','Turkish','2000-06-21');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13006,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20006,13006,2,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20006);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (206,13006,NULL,2,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13007,'fb_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Fred','Rodrigues','Brazilian','1993-03-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13007,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20007,13007,2,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20007);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (207,13007,NULL,2,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13008,'fb_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Sebastian','Szymanski','Polish','1999-05-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13008,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20008,13008,2,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20008);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (208,13008,NULL,2,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13009,'fb_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Sofyan','Amrabat','Moroccan','1996-08-21');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13009,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20009,13009,2,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20009);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (209,13009,NULL,2,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13010,'fb_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Dusan','Tadic','Serbian','1988-11-20');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13010,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20010,13010,2,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20010);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (210,13010,NULL,2,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13011,'fb_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Edin','Dzeko','Bosnian','1986-03-17');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13011,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20011,13011,2,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20011);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (211,13011,NULL,2,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13012,'fb_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Michy','Batshuayi','Belgian','1993-10-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13012,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20012,13012,2,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20012);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (212,13012,NULL,2,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13013,'fb_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Cengiz','Under2','Turkish','1997-07-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13013,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20013,13013,2,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20013);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (213,13013,NULL,2,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13014,'fb_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Rodrigo','Becao','Brazilian','1996-12-26');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13014,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20014,13014,2,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20014);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (214,13014,NULL,2,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13015,'bjk_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Mert','Gunok','Turkish','1989-03-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13015,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20015,13015,3,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20015);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (215,13015,NULL,3,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13016,'bjk_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ersin','Destanoglu','Turkish','2001-03-17');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13016,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20016,13016,3,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20016);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (216,13016,NULL,3,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13017,'bjk_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Joao','Moutinho','Portuguese','2000-09-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13017,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20017,13017,3,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20017);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (217,13017,NULL,3,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13018,'bjk_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Arthur','Masuaku','French','1993-11-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13018,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20018,13018,3,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20018);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (218,13018,NULL,3,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13019,'bjk_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Felix','Uduokhai','German','1997-09-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13019,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20019,13019,3,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20019);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (219,13019,NULL,3,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13020,'bjk_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Necip','Uysal','Turkish','1991-01-24');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13020,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20020,13020,3,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20020);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (220,13020,NULL,3,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13021,'bjk_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Salih','Ucan','Turkish','1994-01-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13021,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20021,13021,3,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20021);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (221,13021,NULL,3,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13022,'bjk_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','AlMusrati','Mohammed','Libyan','1996-08-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13022,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20022,13022,3,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20022);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (222,13022,NULL,3,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13023,'bjk_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Gedson','Fernandes2','Portuguese','1999-01-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13023,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20023,13023,3,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20023);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (223,13023,NULL,3,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13024,'bjk_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Dele','Alli','English','1996-04-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13024,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20024,13024,3,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20024);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (224,13024,NULL,3,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13025,'bjk_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Cenk','Tosun','Turkish','1991-06-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13025,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20025,13025,3,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20025);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (225,13025,NULL,3,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13026,'bjk_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Rachid','Ghezzal','Algerian','1992-05-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13026,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20026,13026,3,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20026);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (226,13026,NULL,3,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13027,'bjk_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ernest','Muci','Albanian','2001-03-19');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13027,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20027,13027,3,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20027);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (227,13027,NULL,3,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13028,'bjk_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Jonas','Svensson','Norwegian','1993-08-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13028,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20028,13028,3,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20028);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (228,13028,NULL,3,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13029,'bjk_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Valentin','Rosier','French','1997-01-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13029,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20029,13029,3,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20029);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (229,13029,NULL,3,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13030,'mci_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ederson','Moraes','Brazilian','1993-08-17');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13030,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20030,13030,4,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20030);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (230,13030,NULL,4,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13031,'mci_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Stefan','Ortega','German','1992-11-06');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13031,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20031,13031,4,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20031);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (231,13031,NULL,4,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13032,'mci_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Kyle','Walker','English','1990-05-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13032,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20032,13032,4,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20032);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (232,13032,NULL,4,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13033,'mci_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ruben','Dias','Portuguese','1997-05-14');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13033,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20033,13033,4,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20033);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (233,13033,NULL,4,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13034,'mci_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Manuel','Akanji','Swiss','1995-07-19');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13034,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20034,13034,4,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20034);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (234,13034,NULL,4,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13035,'mci_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Josko','Gvardiol','Croatian','2002-01-23');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13035,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20035,13035,4,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20035);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (235,13035,NULL,4,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13036,'mci_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Rodri','Hernandez','Spanish','1996-06-22');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13036,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20036,13036,4,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20036);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (236,13036,NULL,4,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13037,'mci_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Kevin','DeBruyne','Belgian','1991-06-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13037,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20037,13037,4,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20037);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (237,13037,NULL,4,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13038,'mci_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Bernardo','Silva2','Portuguese','1994-08-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13038,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20038,13038,4,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20038);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (238,13038,NULL,4,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13039,'mci_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Phil','Foden','English','2000-05-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13039,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20039,13039,4,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20039);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (239,13039,NULL,4,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13040,'mci_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Erling','Haaland','Norwegian','2000-07-21');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13040,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20040,13040,4,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20040);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (240,13040,NULL,4,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13041,'mci_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Jeremy','Doku','Belgian','2002-05-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13041,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20041,13041,4,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20041);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (241,13041,NULL,4,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13042,'mci_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Oscar','Bobb','Norwegian','2003-07-12');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13042,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20042,13042,4,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20042);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (242,13042,NULL,4,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13043,'mci_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Julian','Alvarez2','Argentinian','2000-01-31');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13043,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20043,13043,4,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20043);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (243,13043,NULL,4,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13044,'mci_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Jack','Grealish','English','1995-09-10');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13044,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20044,13044,4,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20044);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (244,13044,NULL,4,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13045,'lfc_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Alisson','Becker','Brazilian','1992-10-02');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13045,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20045,13045,5,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20045);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (245,13045,NULL,5,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13046,'lfc_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Caoimhin','Kelleher','Irish','1998-11-23');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13046,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20046,13046,5,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20046);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (246,13046,NULL,5,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13047,'lfc_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Trent','AlexanderArnold','English','1998-10-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13047,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20047,13047,5,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20047);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (247,13047,NULL,5,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13048,'lfc_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Virgil','VanDijk','Dutch','1991-07-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13048,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20048,13048,5,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20048);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (248,13048,NULL,5,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13049,'lfc_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Andrew','Robertson','Scottish','1994-03-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13049,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20049,13049,5,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20049);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (249,13049,NULL,5,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13050,'lfc_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ibrahima','Konate','French','1999-05-25');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13050,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20050,13050,5,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20050);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (250,13050,NULL,5,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13051,'lfc_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Alexis','MacAllister','Argentinian','1998-12-24');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13051,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20051,13051,5,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20051);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (251,13051,NULL,5,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13052,'lfc_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Dominik','Szoboszlai','Hungarian','2000-10-25');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13052,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20052,13052,5,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20052);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (252,13052,NULL,5,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13053,'lfc_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ryan','Gravenberch','Dutch','2002-05-16');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13053,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20053,13053,5,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20053);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (253,13053,NULL,5,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13054,'lfc_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Curtis','Jones','English','2001-01-30');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13054,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20054,13054,5,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20054);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (254,13054,NULL,5,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13055,'lfc_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Mohamed','Salah','Egyptian','1992-06-15');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13055,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20055,13055,5,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20055);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (255,13055,NULL,5,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13056,'lfc_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Luis','Diaz2','Colombian','1997-01-13');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13056,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20056,13056,5,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20056);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (256,13056,NULL,5,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13057,'lfc_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Darwin','Nunez','Uruguayan','1999-06-24');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13057,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20057,13057,5,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20057);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (257,13057,NULL,5,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13058,'lfc_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Diogo','Jota','Portuguese','1996-12-04');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13058,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20058,13058,5,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20058);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (258,13058,NULL,5,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13059,'lfc_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Cody','Gakpo','Dutch','1999-05-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13059,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20059,13059,5,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20059);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (259,13059,NULL,5,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13060,'ts_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Ugurcan','Cakir2','Turkish','1996-04-22');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13060,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20060,13060,6,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20060);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (260,13060,NULL,6,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13061,'ts_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Kerem','Koybasi','Turkish','2000-01-15');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13061,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20061,13061,6,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20061);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (261,13061,NULL,6,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13062,'ts_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Marc','Bartra','Spanish','1991-01-15');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13062,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20062,13062,6,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20062);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (262,13062,NULL,6,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13063,'ts_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Vitor','Hugo','Brazilian','1992-01-21');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13063,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20063,13063,6,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20063);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (263,13063,NULL,6,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13064,'ts_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Okay','Yokuslu','Turkish','1994-03-09');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13064,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20064,13064,6,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20064);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (264,13064,NULL,6,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13065,'ts_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Domagoj','Vida','Croatian','1989-04-29');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13065,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20065,13065,6,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20065);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (265,13065,NULL,6,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13066,'ts_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Dorukhan','Tokoz','Turkish','1996-04-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13066,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20066,13066,6,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20066);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (266,13066,NULL,6,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13067,'ts_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Jakub','Jankto','Czech','1996-01-19');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13067,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20067,13067,6,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20067);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (267,13067,NULL,6,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13068,'ts_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Anastasios','Bakasetas','Greek','1994-06-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13068,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20068,13068,6,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20068);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (268,13068,NULL,6,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13069,'ts_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Stefano','Denswil','Dutch','1993-05-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13069,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20069,13069,6,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20069);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (269,13069,NULL,6,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13070,'ts_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Nicolas','Pepe2','Ivorian','1995-05-29');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13070,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20070,13070,6,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20070);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (270,13070,NULL,6,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13071,'ts_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Edin','Visca','Bosnian','1990-11-16');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13071,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20071,13071,6,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20071);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (271,13071,NULL,6,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13072,'ts_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Yunus','Akgun','Turkish','2000-02-21');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13072,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20072,13072,6,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20072);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (272,13072,NULL,6,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13073,'ts_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Bruno','Peres','Brazilian','1990-03-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13073,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20073,13073,6,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20073);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (273,13073,NULL,6,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13074,'ts_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Paul','Onuachu','Nigerian','1994-07-28');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13074,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20074,13074,6,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20074);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (274,13074,NULL,6,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13075,'hts_gk1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Muhammet','Sengezer','Turkish','1992-12-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13075,1500000,'Goalkeeper','Right',190);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20075,13075,7,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20075);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (275,13075,NULL,7,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13076,'hts_gk2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Daniel','Sinani','Luxembourgish','1997-04-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13076,1500000,'Goalkeeper','Right',188);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20076,13076,7,'2025-07-01','2028-06-30',150000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20076);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (276,13076,NULL,7,'2025-07-01',1500000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13077,'hts_df1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Marko','Gobeljic','Serbian','1994-11-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13077,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20077,13077,7,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20077);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (277,13077,NULL,7,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13078,'hts_df2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Samuel','Gigot','French','1993-08-08');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13078,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20078,13078,7,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20078);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (278,13078,NULL,7,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13079,'hts_df3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Luan','Rodrigues','Brazilian','1997-04-13');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13079,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20079,13079,7,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20079);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (279,13079,NULL,7,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13080,'hts_df4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Atakan','Akkaynak','Turkish','1999-08-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13080,2000000,'Defender','Right',185);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20080,13080,7,'2025-07-01','2028-06-30',200000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20080);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (280,13080,NULL,7,'2025-07-01',2000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13081,'hts_mf1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Amara','Baby','Guinean','1990-08-05');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13081,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20081,13081,7,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20081);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (281,13081,NULL,7,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13082,'hts_mf2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Danijel','Aleksic','Serbian','1993-01-15');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13082,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20082,13082,7,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20082);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (282,13082,NULL,7,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13083,'hts_mf3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Mehmet','Gul','Turkish','1995-03-22');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13083,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20083,13083,7,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20083);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (283,13083,NULL,7,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13084,'hts_mf4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Mahmut','Tekdemir','Turkish','1996-07-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13084,3000000,'Midfielder','Right',180);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20084,13084,7,'2025-07-01','2028-06-30',300000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20084);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (284,13084,NULL,7,'2025-07-01',3000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13085,'hts_fw1','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Samuel','Adegbenro','Nigerian','1997-07-26');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13085,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20085,13085,7,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20085);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (285,13085,NULL,7,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13086,'hts_fw2','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Mame','Diouf','Senegalese','1987-12-11');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13086,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20086,13086,7,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20086);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (286,13086,NULL,7,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13087,'hts_fw3','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Anderson','Talisca2','Brazilian','1994-02-01');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13087,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20087,13087,7,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20087);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (287,13087,NULL,7,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13088,'hts_fw4','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Bahattin','Kocaman','Turkish','1998-09-18');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13088,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20088,13088,7,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20088);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (288,13088,NULL,7,'2025-07-01',4000000,'Purchase');
INSERT IGNORE INTO Person (person_ID,username,password_hash,name,surname,nationality,date_of_birth) VALUES (13089,'hts_fw5','81f1ec8594eb4bf22282225ece8f879ddb86f1ed265bb3ec66bcb5f5d9fe2cd7','Franck','Ribery2','French','1983-04-07');
INSERT IGNORE INTO Player (person_ID,market_value,main_position,strong_foot,height_cm) VALUES (13089,4000000,'Forward','Right',178);
INSERT IGNORE INTO Contract (contract_id,player_id,club_id,start_date,end_date,weekly_wage,contract_type) VALUES (20089,13089,7,'2025-07-01','2028-06-30',400000,'Permanent');
INSERT IGNORE INTO PermanentContract (contract_id) VALUES (20089);
INSERT IGNORE INTO TransferRecord (transfer_id,player_id,from_club_id,to_club_id,transfer_date,transfer_fee,transfer_type) VALUES (289,13089,NULL,7,'2025-07-01',4000000,'Purchase');

-- ============================================================
-- Matches with pre-submitted squads
-- Past (is_played=0, date passed) = referee can submit result
-- Future = manager can see fixtures, squads already submitted
-- ============================================================
-- Fenerbahce vs Besiktas — ref: test_referee1
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3001,'2026-04-10','18:00:00',0,2,3,12004,2,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13000,2,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13001,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13002,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13003,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13004,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13005,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13006,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13007,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13008,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13009,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13010,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13011,2,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13012,2,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13013,2,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13014,2,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13015,3,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13016,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13017,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13018,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13019,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13020,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13021,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13022,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13023,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13024,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13025,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13026,3,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13027,3,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13028,3,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3001,13029,3,0,30,'Forward',0,0,0,0);

-- ManCity vs Liverpool — ref: cuneyt_cakir
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3002,'2026-04-08','20:45:00',0,4,5,1001,1,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13030,4,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13031,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13032,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13033,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13034,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13035,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13036,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13037,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13038,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13039,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13040,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13041,4,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13042,4,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13043,4,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13044,4,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13045,5,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13046,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13047,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13048,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13049,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13050,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13051,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13052,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13053,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13054,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13055,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13056,5,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13057,5,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13058,5,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3002,13059,5,0,30,'Forward',0,0,0,0);

-- Trabzonspor vs Hatayspor — ref: halil_meler
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3003,'2026-04-09','19:00:00',0,6,7,1002,9,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13060,6,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13061,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13062,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13063,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13064,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13065,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13066,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13067,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13068,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13069,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13070,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13071,6,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13072,6,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13073,6,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13074,6,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13075,7,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13076,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13077,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13078,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13079,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13080,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13081,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13082,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13083,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13084,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13085,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13086,7,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13087,7,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13088,7,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3003,13089,7,0,30,'Forward',0,0,0,0);

-- Galatasaray vs ManCity (CL) — ref: cuneyt_cakir
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3004,'2026-04-05','20:00:00',0,1,4,1001,3,5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1001,1,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1002,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1003,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1004,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1005,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1006,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1007,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1008,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1009,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1010,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1011,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1012,1,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1013,1,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1014,1,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,1015,1,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13030,4,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13031,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13032,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13033,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13034,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13035,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13036,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13037,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13038,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13039,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13040,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13041,4,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13042,4,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13043,4,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3004,13044,4,0,30,'Forward',0,0,0,0);

-- Liverpool vs Fenerbahce (EL) — ref: halil_meler
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3005,'2026-04-03','18:55:00',0,5,2,1002,5,6);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13045,5,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13046,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13047,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13048,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13049,5,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13050,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13051,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13052,5,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13053,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13054,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13055,5,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13056,5,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13057,5,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13058,5,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13059,5,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13000,2,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13001,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13002,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13003,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13004,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13005,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13006,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13007,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13008,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13009,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13010,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13011,2,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13012,2,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13013,2,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3005,13014,2,0,30,'Forward',0,0,0,0);

-- Fenerbahce vs Trabzonspor (future)
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3006,'2026-05-02','15:00:00',0,2,6,12004,2,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13000,2,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13001,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13002,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13003,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13004,2,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13005,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13006,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13007,2,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13008,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13009,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13010,2,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13011,2,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13012,2,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13013,2,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13014,2,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13060,6,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13061,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13062,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13063,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13064,6,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13065,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13066,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13067,6,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13068,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13069,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13070,6,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13071,6,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13072,6,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13073,6,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3006,13074,6,0,30,'Forward',0,0,0,0);

-- Besiktas vs Hatayspor (future)
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3007,'2026-05-03','15:00:00',0,3,7,1001,4,1);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13015,3,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13016,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13017,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13018,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13019,3,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13020,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13021,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13022,3,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13023,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13024,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13025,3,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13026,3,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13027,3,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13028,3,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13029,3,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13075,7,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13076,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13077,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13078,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13079,7,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13080,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13081,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13082,7,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13083,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13084,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13085,7,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13086,7,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13087,7,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13088,7,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3007,13089,7,0,30,'Forward',0,0,0,0);

-- ManCity vs Galatasaray (CL, future)
INSERT IGNORE INTO `Match` (match_ID,match_date,match_time,is_played,home_club_ID,away_club_ID,referee_ID,stadium_ID,competition_ID) VALUES (3008,'2026-05-06','20:00:00',0,4,1,1002,1,5);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13030,4,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13031,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13032,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13033,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13034,4,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13035,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13036,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13037,4,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13038,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13039,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13040,4,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13041,4,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13042,4,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13043,4,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,13044,4,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1001,1,1,90,'Goalkeeper',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1002,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1003,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1004,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1005,1,1,90,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1006,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1007,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1008,1,1,90,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1009,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1010,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1011,1,1,90,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1012,1,0,30,'Midfielder',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1013,1,0,30,'Defender',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1014,1,0,30,'Forward',0,0,0,0);
INSERT IGNORE INTO Match_Participation (match_ID,player_id,club_id,is_starter,minutes_played,position_in_match,goals,assists,yellow_cards,red_cards) VALUES (3008,1015,1,0,30,'Forward',0,0,0,0);

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

-- Done! All new users: password = Mock@1234