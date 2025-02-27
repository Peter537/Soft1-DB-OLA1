create function gettotalwins(player_id integer) returns integer
    language plpgsql
as
$$
    begin
        select COUNT(*) from matches where winner_id = player_id;
    end;
$$;

alter function gettotalwins(integer) owner to postgres;


create function gettournamentstatus(tournamentid integer) returns character varying
    language plpgsql
as
$$
declare
    tournStatus varchar;
begin
    select status into tournStatus
    from tournaments
    where tournament_id = tournamentId;
    
    IF tournStatus IS NULL THEN
        return 'Tournament does not exist';
    ELSE
        return tournStatus;
    END IF;
end $$;

alter function gettournamentstatus(integer) owner to postgres;

