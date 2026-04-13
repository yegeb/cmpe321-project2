# Part 3 Draft Notes

This draft is a starting point for `part3.pdf`.

## Scope

The current schema consists of the following core relations:

- `DatabaseManager(db_manager_id, username, password_hash)`
- `Person(person_ID, username, password_hash, name, surname, nationality, date_of_birth)`
- `Player(person_ID, market_value, main_position, strong_foot, height_cm)`
- `Manager(person_ID, preferred_formation, experience_level)`
- `Referee(person_ID, license_level, years_experience)`
- `Stadium(stadium_ID, stadium_name, city, capacity)`
- `Club(club_ID, club_name, stadium_ID, city, foundation_year)`
- `Leads(club_ID, manager_ID, start_date, end_date)`
- `Contract(contract_id, player_id, club_id, start_date, end_date, weekly_wage, contract_type)`
- `PermanentContract(contract_id)`
- `LoanContract(contract_id, parent_permanent_contract_id)`
- `TransferRecord(transfer_id, player_id, from_club_id, to_club_id, transfer_date, transfer_fee, transfer_type)`
- `Competition(competition_ID, name, season, country, competition_type)`
- `Club_Competition_Participation(club_ID, competition_ID)`
- `Match(match_ID, match_date, match_time, is_played, attendance, home_goals, away_goals, home_club_ID, away_club_ID, referee_ID, stadium_ID, competition_ID)`
- `Match_Participation(match_ID, player_id, club_id, is_starter, minutes_played, position_in_match, goals, assists, yellow_cards, red_cards, rating)`

## Non-trivial Functional Dependencies

### DatabaseManager

- `db_manager_id -> username, password_hash`
- `username -> db_manager_id, password_hash`

BCNF holds because every determinant is a key.

### Person

- `person_ID -> username, password_hash, name, surname, nationality, date_of_birth`
- `username -> person_ID, password_hash, name, surname, nationality, date_of_birth`

BCNF holds because both `person_ID` and `username` are candidate keys.

### Player

- `person_ID -> market_value, main_position, strong_foot, height_cm`

BCNF holds because `person_ID` is the key.

### Manager

- `person_ID -> preferred_formation, experience_level`

BCNF holds because `person_ID` is the key.

### Referee

- `person_ID -> license_level, years_experience`

BCNF holds because `person_ID` is the key.

### Stadium

- `stadium_ID -> stadium_name, city, capacity`
- `(stadium_name, city) -> stadium_ID, capacity`

BCNF holds because `stadium_ID` is a key and `(stadium_name, city)` is also enforced as unique.

### Club

- `club_ID -> club_name, stadium_ID, city, foundation_year`
- `club_name -> club_ID, stadium_ID, city, foundation_year`

BCNF holds because `club_ID` and `club_name` are candidate keys.

### Leads

- `(club_ID, manager_ID, start_date) -> end_date`

This relation is in BCNF under the implemented schema because the composite primary key determines the only non-key attribute.

### Contract

- `contract_id -> player_id, club_id, start_date, end_date, weekly_wage, contract_type`

BCNF holds because `contract_id` is the key.

### PermanentContract

- `contract_id ->`

BCNF trivially holds.

### LoanContract

- `contract_id -> parent_permanent_contract_id`

BCNF holds because `contract_id` is the key.

### TransferRecord

- `transfer_id -> player_id, from_club_id, to_club_id, transfer_date, transfer_fee, transfer_type`

BCNF holds because `transfer_id` is the key.

### Competition

- `competition_ID -> name, season, country, competition_type`
- `(name, season) -> competition_ID, country, competition_type`

BCNF holds because both determinants are candidate keys.

### Club_Competition_Participation

- `(club_ID, competition_ID) ->`

BCNF trivially holds.

### Match

- `match_ID -> match_date, match_time, is_played, attendance, home_goals, away_goals, home_club_ID, away_club_ID, referee_ID, stadium_ID, competition_ID`

BCNF holds because `match_ID` is the key.

### Match_Participation

- `(match_ID, player_id) -> club_id, is_starter, minutes_played, position_in_match, goals, assists, yellow_cards, red_cards, rating`

BCNF holds because the composite primary key determines all non-key attributes.

## Additional Constraints Enforced in Project 2

The following business rules are enforced with SQL constraints/triggers instead of relying only on application code:

- No match can be scheduled in the past.
- No stadium, referee, or club can be scheduled within 120 minutes of another match.
- A club cannot register more than 11 starters.
- A club cannot register more than 23 squad members.
- A manager cannot actively lead more than one club.
- A club cannot have more than one active manager.
- A player can have at most one active permanent contract and one active loan contract.
- A loan contract requires an active permanent contract with another club.
- Attendance cannot exceed stadium capacity.
- A result cannot be submitted before kickoff.
- A played match must include attendance and final score fields.
- A player can only be added to a match squad if they have an active contract for that club on the match date.
- A loaned player cannot appear for the parent club during the loan period.
- A match cannot be marked as played unless both clubs have valid squad sizes and exactly 11 starters.

## Notes for Final PDF

- Add a short introduction explaining that most relations already satisfy BCNF because the design uses surrogate primary keys and decomposition for specialization tables.
- Mention that `PermanentContract` and `LoanContract` separate subtype-specific constraints from `Contract`.
- Mention that some real-world temporal rules are not pure FD issues, so they are enforced with triggers instead of decomposition.
- Convert this draft into a cleaner report format with 1 relation per subsection.
