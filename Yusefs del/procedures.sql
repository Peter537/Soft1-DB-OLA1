create procedure creatematch(IN tournamentid integer, IN player1id integer, IN player2id integer)
    language plpgsql
as
$$
    -- Jeg tænker at en match ikke skal laves med en vinder da matches laves forud for resultatet.
    -- En anden procedure kan så bruges til at opdatere en match med en vinder.
    BEGIN

INSERT INTO matches (tournament_id, player1_id, player2_id,utc_match_timestamp)
        VALUES(tournamentId, player1Id, player2Id, now());
    end;
    $$;



create procedure submitmatchresult(IN matchid integer, IN winnerid integer)
    language plpgsql
as
$$
    BEGIN
        UPDATE matches
        SET winner_id = winnerId
        WHERE match_id = matchId;

    -- Den her metode ændrer kun winner_id, og så har jeg lavet en trigger der ændrer rank i create scriptet
    END;
$$;


create procedure jointournament(IN p_tournament_id integer, IN p_player_id integer)
    language plpgsql
as
$$
BEGIN
    INSERT INTO tournament_registrations (tournament_id, player_id, utc_registered_at)
    VALUES (p_tournament_id, p_player_id, NOW());

    -- Denne funktion tilføjer en ny registration, og der er en trigger der sørger for at tjekke om der er plads i turneringen.

    -- logger for at teste, men beholder det fordi jeg ikke før har brugt reaise notice.
    
    RAISE NOTICE 'Player % joined tournament %', p_player_id, p_tournament_id;
END $$;


create procedure registerplayer(IN p_username character varying, IN p_email character varying)
    language plpgsql
as
$$
DECLARE timestamp TIMESTAMP DEFAULT NOW();

-- laver sådanset bare en player og tilføjer NOW() timestampet dertil. Det kunne også bare kastes ind i "Values" delen i stedet for at lave ne declare

BEGIN
    INSERT INTO players (username, email, utc_created_at)
    VALUES (p_username, p_email, timestamp);
END $$;



