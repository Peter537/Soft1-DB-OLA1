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
                             status VARCHAR NOT NULL DEFAULT 'upcoming',
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

CREATE function checkTournamentFull() returns trigger
    language plpgsql
as
$$
    BEGIN
        -- Check if the player is already registered for the tournament
        IF EXISTS(SELECT 1 FROM tournament_registrations WHERE tournament_id = NEW.tournament_id AND player_id = NEW.player_id) THEN
            RAISE EXCEPTION 'Player is already registered for the tournament';
        END IF;

        IF (SELECT t.max_players FROM tournaments t where t.tournament_id = NEW.tournament_id) <=
           (SELECT COUNT(*) FROM tournament_registrations WHERE tournament_id = NEW.tournament_id) THEN
            RAISE EXCEPTION 'Tournament is full';
        END IF;

        RETURN NEW;
    END $$;
    end;

CREATE TRIGGER before_insert_registration
    BEFORE INSERT
    ON tournament_registrations
    FOR EACH ROW
    EXECUTE FUNCTION checkTournamentFull();




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

create function calculatenewratings() returns trigger
    language plpgsql
as
$$
BEGIN
    -- Update the ratings of the players after the match
    UPDATE players
    SET rating = rating +
                 (50 * (1 / (1 + POWER(10, (SELECT rating FROM players WHERE player_id =
                                                                             CASE WHEN NEW.winner_id = NEW.player1_id THEN NEW.player2_id ELSE NEW.player1_id END) -
                                           (SELECT rating FROM players WHERE player_id = NEW.winner_id)) / 400.0)))
    WHERE player_id = NEW.winner_id;

    UPDATE players
    SET rating = rating -
                 (50 * (1 / (1 + POWER(10, (SELECT rating FROM players WHERE player_id =
                                                                             CASE WHEN NEW.winner_id = NEW.player1_id THEN NEW.player2_id ELSE NEW.player1_id END) -
                                           (SELECT rating FROM players WHERE player_id = NEW.winner_id)) / 400.0)))
    WHERE player_id =
          CASE
              WHEN NEW.winner_id = NEW.player1_id THEN NEW.player2_id
              ELSE NEW.player1_id
              END;

    RETURN NEW;
END $$;

alter function calculatenewratings() owner to postgres;



-- auto-generated definition
create trigger update_rating
    after update
        of winner_id
    on matches
    for each row
execute procedure calculatenewratings();
-- Husk først at køre procedure-function.sql scriptet så triggers virker


