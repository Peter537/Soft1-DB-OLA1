CREATE PROCEDURE createMatch(
    IN tournamentId INTEGER,
    IN player1Id INTEGER,
    IN player2Id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Jeg tænker at en match ikke skal laves med en vinder da matches laves forud for resultatet.
    -- En anden procedure kan da bruges til at opdatere en match med en vinder.
    INSERT INTO matches (tournament_id, player1_id, player2_id, utc_match_timestamp)
    VALUES (tournamentId, player1Id, player2Id, NOW());
END;
$$;


CREATE PROCEDURE submitMatchResult(
    IN matchId INTEGER,
    IN winnerId INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE matches
    SET winner_id = winnerId
    WHERE match_id = matchId;

    -- Den her metode ændrer kun winner_id, og så har jeg lavet en trigger der ændrer rank i create scriptet
END;
$$;


CREATE PROCEDURE joinTournament(
    IN tournamentId INTEGER,
    IN playerId INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO tournament_registrations (tournament_id, player_id, utc_registered_at)
    VALUES (tournamentId, playerId, NOW());

    -- Denne funktion tilføjer en ny registration, og der er en trigger der sørger for at tjekke om der er plads i turneringen.
    -- Logger for at teste, men beholder det fordi jeg ikke før har brugt RAISE NOTICE.
    RAISE NOTICE 'Player % joined tournament %', playerId, tournamentId;
END;
$$;


CREATE PROCEDURE registerPlayer(
    IN username VARCHAR,
    IN email VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    currentTimestamp TIMESTAMP DEFAULT NOW();
BEGIN
    -- Laver sådanset bare en player og tilføjer NOW() timestampet dertil.
    -- Det kunne også bare kastes ind i "VALUES" delen i stedet for at lave en DECLARE.
    INSERT INTO players (username, email, utc_created_at)
    VALUES (username, email, currentTimestamp);
END;
$$;
