-- 1. Hent alle turneringer, der starter inden for de næste 30 dage.
select * from tournaments where utc_start_timestamp < now() + interval '30 days';


-- 2. Find det antal turneringer, en spiller har deltaget i.
SELECT COUNT(player_id) as tournament_count
FROM tournaments t, tournament_registrations tr
WHERE t.tournament_id = tr.tournament_id AND tr.player_id = 1;


-- 3. Vis en liste over spillere registreret i en bestemt turnering.
SELECT p.player_id, username
FROM players p, tournament_registrations tr
WHERE tr.tournament_id = 1 AND p.player_id = tr.player_id;


-- 4. Find spillere med flest sejre i en bestemt turnering.
SELECT p.player_id, p.username, COUNT(m.winner_id) AS wins
FROM matches m
JOIN players p ON m.winner_id = p.player_id
WHERE m.tournament_id = 1
GROUP BY p.player_id, p.username
ORDER BY wins DESC


-- 5. Hent alle kampe, hvor en bestemt spiller har deltaget.
SELECT * FROM matches WHERE player1_id = 4 OR player2_id = 4;


-- 6. Hent en spillers tilmeldte turneringer.
SELECT t.* from tournaments t, tournament_registrations tr
WHERE tr.player_id = 4 AND t.tournament_id = tr.tournament_id;


-- 7. Find de 5 bedst rangerede spillere.
SELECT player_id, username, rating
FROM players
ORDER BY rating DESC
LIMIT 5;


-- 8. Beregn gennemsnitlig ranking for alle spillere.
SELECT AVG(rating) as avg_rating from players;


-- 9. Vis turneringer med mindst 5 deltagere.
SELECT t.*, COUNT(tr.player_id) AS num_players
FROM tournaments t
JOIN tournament_registrations tr ON t.tournament_id = tr.tournament_id
GROUP BY t.tournament_id
HAVING COUNT(tr.player_id) >= 5;


-- 10. Find det samlede antal spillere i systemet.
SELECT COUNT(*) FROM players;


-- 11. Find alle kampe, der mangler en vinder.
SELECT * FROM matches WHERE winner_id is NULL;


-- 12. Vis de mest populære spil baseret på turneringsantal.
SELECT game, COUNT(tournament_id) as tournament_cnt
FROM tournaments
group by game
order by tournament_cnt DESC;

-- 13. Find de 5 nyeste oprettede turneringer.
SELECT *
FROM tournaments
order by utc_created_at DESC;
LIMIT 5;

-- 14. Find spillere, der har registreret sig i flere end 3 turneringer.
SELECT p.*
FROM players p
JOIN tournament_registrations tr ON p.player_id = tr.player_id
GROUP BY p.player_id
HAVING COUNT(tr.tournament_id) > 3;


-- 15. Hent alle kampe i en turnering sorteret efter dato.
SELECT *
FROM matches
WHERE tournament_id = 4
ORDER BY utc_match_timestamp ASC;
