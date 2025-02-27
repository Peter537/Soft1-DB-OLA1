TRUNCATE TABLE players, tournaments, tournament_registrations, matches RESTART IDENTITY CASCADE;

--
-- Players
--
INSERT INTO players (username, email, utc_created_at) VALUES
('user1', 'user1@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user2', 'user2@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user3', 'user3@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user4', 'user4@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user5', 'user5@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user6', 'user6@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user7', 'user7@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user8', 'user8@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user9', 'user9@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user10', 'user10@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user11', 'user11@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user12', 'user12@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user13', 'user13@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user14', 'user14@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user15', 'user15@gmail.com', NOW() AT TIME ZONE 'UTC'),
('user16', 'user16@gmail.com', NOW() AT TIME ZONE 'UTC');

--
-- Tournaments
--
INSERT INTO tournaments (name, game, max_players, status, utc_start_timestamp, utc_created_at) VALUES
('tournament1', 'Counter-Strike 2', 4, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days', NOW() AT TIME ZONE 'UTC'),
('tournament2', 'Counter-Strike 2', 8, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days', NOW() AT TIME ZONE 'UTC'),
('tournament3', 'Dota 2', 4, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days', NOW() AT TIME ZONE 'UTC'),
('tournament4', 'Counter-Strike 2', 8, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days', NOW() AT TIME ZONE 'UTC'),
('tournament5', 'Counter-Strike 2', 4, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '7 days', NOW() AT TIME ZONE 'UTC'),
('tournament6', 'League of Legends', 8, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days', NOW() AT TIME ZONE 'UTC'),
('tournament7', 'Dota 2', 4, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '31 days', NOW() AT TIME ZONE 'UTC'),
('tournament8', 'Counter-Strike 2', 8, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days', NOW() AT TIME ZONE 'UTC');

--
-- Tournament Registrations
--
INSERT INTO tournament_registrations (tournament_id, player_id, utc_registered_at) VALUES
-- Tournament 1
(1, 1, NOW() AT TIME ZONE 'UTC'),
(1, 5, NOW() AT TIME ZONE 'UTC'),
(1, 9, NOW() AT TIME ZONE 'UTC'),
(1, 12, NOW() AT TIME ZONE 'UTC'),
-- Tournament 2
(2, 2, NOW() AT TIME ZONE 'UTC'),
(2, 4, NOW() AT TIME ZONE 'UTC'),
(2, 6, NOW() AT TIME ZONE 'UTC'),
(2, 8, NOW() AT TIME ZONE 'UTC'),
(2, 10, NOW() AT TIME ZONE 'UTC'),
(2, 12, NOW() AT TIME ZONE 'UTC'),
(2, 14, NOW() AT TIME ZONE 'UTC'),
(2, 16, NOW() AT TIME ZONE 'UTC'),
-- Tournament 3
(3, 3, NOW() AT TIME ZONE 'UTC'),
(3, 7, NOW() AT TIME ZONE 'UTC'),
(3, 11, NOW() AT TIME ZONE 'UTC'),
(3, 15, NOW() AT TIME ZONE 'UTC'),
-- Tournament 4
(4, 1, NOW() AT TIME ZONE 'UTC'),
(4, 3, NOW() AT TIME ZONE 'UTC'),
(4, 5, NOW() AT TIME ZONE 'UTC'),
(4, 7, NOW() AT TIME ZONE 'UTC'),
(4, 9, NOW() AT TIME ZONE 'UTC'),
(4, 11, NOW() AT TIME ZONE 'UTC'),
(4, 13, NOW() AT TIME ZONE 'UTC'),
(4, 15, NOW() AT TIME ZONE 'UTC'),
-- Tournament 5
(5, 2, NOW() AT TIME ZONE 'UTC'),
(5, 6, NOW() AT TIME ZONE 'UTC'),
(5, 10, NOW() AT TIME ZONE 'UTC'),
(5, 14, NOW() AT TIME ZONE 'UTC'),
-- Tournament 6
(6, 1, NOW() AT TIME ZONE 'UTC'),
(6, 3, NOW() AT TIME ZONE 'UTC'),
(6, 5, NOW() AT TIME ZONE 'UTC'),
(6, 7, NOW() AT TIME ZONE 'UTC'),
(6, 9, NOW() AT TIME ZONE 'UTC'),
(6, 11, NOW() AT TIME ZONE 'UTC'),
(6, 13, NOW() AT TIME ZONE 'UTC'),
(6, 15, NOW() AT TIME ZONE 'UTC'),
-- Tournament 7
(7, 4, NOW() AT TIME ZONE 'UTC'),
(7, 8, NOW() AT TIME ZONE 'UTC'),
(7, 12, NOW() AT TIME ZONE 'UTC'),
(7, 16, NOW() AT TIME ZONE 'UTC'),
-- Tournament 8
(8, 2, NOW() AT TIME ZONE 'UTC'),
(8, 4, NOW() AT TIME ZONE 'UTC'),
(8, 6, NOW() AT TIME ZONE 'UTC'),
(8, 8, NOW() AT TIME ZONE 'UTC'),
(8, 10, NOW() AT TIME ZONE 'UTC'),
(8, 12, NOW() AT TIME ZONE 'UTC'),
(8, 14, NOW() AT TIME ZONE 'UTC'),
(8, 16, NOW() AT TIME ZONE 'UTC');

--
-- Matches
-- Noter:
--   - For 4-player turneringer: 2 semifinaler og så 1 finale.
--   - For 8-player turneringer: 4 kvartfinaler, 2 semifinaler og så 1 finale.
--   - For fremtidige turneringer (id: 5–8): kun den første matchup er oprettet men ikke spillet, dvs. winner_id = NULL.
--

-- Tournament 1
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Semifinale
  (1, 1, 5, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '3 days'),
  (1, 9, 12, 9, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '3 days'),
  -- Finale
  (1, 1, 9, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '7 days');

-- Tournament 2
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Kvartfinale
  (2, 2, 4, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
  (2, 6, 8, 6, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
  (2, 10, 12, 10, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
  (2, 14, 16, 14, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
  -- Semifinale
  (2, 2, 6, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '4 days'),
  (2, 10, 14, 14, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '4 days'),
  -- Finale
  (2, 2, 14, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '6 days');

-- Tournament 3
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Semifinale
  (3, 3, 7, 3, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '2 days'),
  (3, 11, 15, 11, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '2 days'),
  -- Finale
  (3, 3, 11, 3, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '4 days');

-- Tournament 4
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Kvartfinale
  (4, 1, 3, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '1 day'),
  (4, 5, 7, 5, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '1 day'),
  (4, 9, 11, 9, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '1 day'),
  (4, 13, 15, 13, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '1 day'),
  -- Semifinale
  (4, 1, 5, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '2 days'),
  (4, 9, 13, 9, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '2 days'),
  -- Finale
  (4, 1, 9, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days' + INTERVAL '3 days');

-- Tournament 5
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Semifinale
  (5, 2, 6, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '7 days' + INTERVAL '1 day'),
  (5, 10, 14, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '7 days' + INTERVAL '1 day');

-- Tournament 6
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Kvartfinale
  (6, 1, 3, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days' + INTERVAL '1 day'),
  (6, 5, 7, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days' + INTERVAL '1 day'),
  (6, 9, 11, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days' + INTERVAL '1 day'),
  (6, 13, 15, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days' + INTERVAL '1 day');

-- Tournament 7
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Semifinale
  (7, 4, 8, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '31 days' + INTERVAL '1 day'),
  (7, 12, 16, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '31 days' + INTERVAL '1 day');

-- Tournament 8
INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
  -- Kvartfinale
  (8, 2, 4, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days' + INTERVAL '1 day'),
  (8, 6, 8, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days' + INTERVAL '1 day'),
  (8, 10, 12, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days' + INTERVAL '1 day'),
  (8, 14, 16, NULL, (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days' + INTERVAL '1 day');
