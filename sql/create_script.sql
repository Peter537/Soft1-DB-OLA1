DROP TABLE IF EXISTS players, tournaments, tournament_registrations, matches CASCADE;

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    username VARCHAR(24) NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    rating INTEGER NOT NULL DEFAULT 1000,
    utc_created_at TIMESTAMP NOT NULL
);

CREATE TABLE tournaments (
    tournament_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    game VARCHAR NOT NULL,
    max_players INTEGER NOT NULL,
    utc_start_timestamp TIMESTAMP NOT NULL,
    utc_created_at TIMESTAMP NOT NULL
);

CREATE TABLE tournament_registrations (
    registration_id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL,
    player_id INTEGER NOT NULL,
    utc_registered_at TIMESTAMP NOT NULL,
    CONSTRAINT fk_tournament
        FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    CONSTRAINT fk_player
        FOREIGN KEY (player_id) REFERENCES players(player_id)
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    tournament_id INTEGER NOT NULL,
    player1_id INTEGER NOT NULL,
    player2_id INTEGER NOT NULL,
    winner_id INTEGER,
    utc_match_timestamp TIMESTAMP NOT NULL,
    CONSTRAINT fk_tournament_match
        FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id),
    CONSTRAINT fk_player1
        FOREIGN KEY (player1_id) REFERENCES players(player_id),
    CONSTRAINT fk_player2
        FOREIGN KEY (player2_id) REFERENCES players(player_id),
    CONSTRAINT fk_winner
        FOREIGN KEY (winner_id) REFERENCES players(player_id)
);
