CREATE FUNCTION getTotalWins(playerId INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT COUNT(*) FROM matches WHERE winner_id = playerId);
END;
$$;

ALTER FUNCTION getTotalWins(INTEGER) OWNER TO postgres;


CREATE FUNCTION getTournamentStatus(tournamentId INTEGER)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    tournStatus VARCHAR;
BEGIN
    SELECT status INTO tournStatus
    FROM tournaments
    WHERE tournament_id = tournamentId;

    IF tournStatus IS NULL THEN
        RETURN 'Tournament does not exist';
    ELSE
        RETURN tournStatus;
    END IF;
END;
$$;

ALTER FUNCTION getTournamentStatus(INTEGER) OWNER TO postgres;
