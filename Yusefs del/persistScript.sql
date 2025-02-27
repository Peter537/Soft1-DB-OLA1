create function persistscript() returns json
    language plpgsql
as
$$
BEGIN
    -- Truncate tables and reset identities
    TRUNCATE TABLE players, tournaments, tournament_registrations, matches RESTART IDENTITY CASCADE;

    -- Players
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

    -- Tournaments
    INSERT INTO tournaments (name, game, max_players, status, utc_start_timestamp, utc_created_at) VALUES
                                                                                                       ('tournament1', 'Counter-Strike 2', 4, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament2', 'Counter-Strike 2', 8, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament3', 'Dota 2', 4, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament4', 'Counter-Strike 2', 8, 'completed', (NOW() AT TIME ZONE 'UTC') - INTERVAL '3 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament5', 'Counter-Strike 2', 4, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '7 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament6', 'League of Legends', 8, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '14 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament7', 'Dota 2', 4, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '31 days', NOW() AT TIME ZONE 'UTC'),
                                                                                                       ('tournament8', 'Counter-Strike 2', 8, 'upcoming', (NOW() AT TIME ZONE 'UTC') + INTERVAL '42 days', NOW() AT TIME ZONE 'UTC');

    -- Tournament Registrations
    INSERT INTO tournament_registrations (tournament_id, player_id, utc_registered_at) VALUES
                                                                                           (1, 1, NOW() AT TIME ZONE 'UTC'),
                                                                                           (1, 5, NOW() AT TIME ZONE 'UTC'),
                                                                                           (2, 2, NOW() AT TIME ZONE 'UTC'),
                                                                                           (2, 4, NOW() AT TIME ZONE 'UTC'),
                                                                                           (2, 6, NOW() AT TIME ZONE 'UTC'),
                                                                                           (2, 8, NOW() AT TIME ZONE 'UTC'),
                                                                                           (2, 10, NOW() AT TIME ZONE 'UTC'),
                                                                                           (3, 3, NOW() AT TIME ZONE 'UTC'),
                                                                                           (3, 7, NOW() AT TIME ZONE 'UTC'),
                                                                                           (3, 11, NOW() AT TIME ZONE 'UTC'),
                                                                                           (3, 15, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 1, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 3, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 5, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 7, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 9, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 11, NOW() AT TIME ZONE 'UTC'),
                                                                                           (4, 13, NOW() AT TIME ZONE 'UTC'),
                                                                                           (5, 2, NOW() AT TIME ZONE 'UTC'),
                                                                                           (5, 6, NOW() AT TIME ZONE 'UTC'),
                                                                                           (5, 10, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 1, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 3, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 5, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 7, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 9, NOW() AT TIME ZONE 'UTC'),
                                                                                           (6, 11, NOW() AT TIME ZONE 'UTC'),
                                                                                           (7, 4, NOW() AT TIME ZONE 'UTC'),
                                                                                           (7, 8, NOW() AT TIME ZONE 'UTC'),
                                                                                           (7, 12, NOW() AT TIME ZONE 'UTC'),
                                                                                           (7, 16, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 2, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 4, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 6, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 8, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 10, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 12, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 14, NOW() AT TIME ZONE 'UTC'),
                                                                                           (8, 16, NOW() AT TIME ZONE 'UTC');

    -- Matches
    -- Tournament 1 - Matches
    INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
                                                                                                    (1, 1, 5, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '3 days'),
                                                                                                    (1, 9, 12, 9, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '3 days'),
                                                                                                    (1, 1, 9, 1, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '7 days'),
                                                                                                    (1, 1, 9, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '10 days'),
                                                                                                    (1, 1, 9, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '14 days'),
                                                                                                    (1, 1, 9, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '21 days' + INTERVAL '18 days');

    -- Tournament 2 - Matches
    INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
                                                                                                    (2, 2, 4, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
                                                                                                    (2, 6, 8, 6, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
                                                                                                    (2, 10, 12, 10, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
                                                                                                    (2, 14, 16, 14, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '2 days'),
                                                                                                    (2, 2, 6, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '4 days'),
                                                                                                    (2, 10, 14, 14, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '4 days'),
                                                                                                    (2, 2, 14, 2, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '6 days'),
                                                                                                    (2, 2, 14, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '8 days'),
                                                                                                    (2, 2, 14, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '10 days'),
                                                                                                    (2, 2, 14, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '14 days' + INTERVAL '12 days');

    -- Tournament 3 - Matches
    INSERT INTO matches (tournament_id, player1_id, player2_id, winner_id, utc_match_timestamp) VALUES
                                                                                                    (3, 3, 7, 3, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '2 days'),
                                                                                                    (3, 11, 15, 11, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '2 days'),
                                                                                                    (3, 3, 11, 3, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '6 days'),
                                                                                                    (3, 3, 11, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '10 days'),
                                                                                                    (3, 3, 11, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '14 days'),
                                                                                                    (3, 3, 11, null, (NOW() AT TIME ZONE 'UTC') - INTERVAL '7 days' + INTERVAL '18 days');

    -- Return confirmation message
    RETURN '{"status": "Test data successfully inserted"}';
END;
$$;

alter function persistscript() owner to postgres;

