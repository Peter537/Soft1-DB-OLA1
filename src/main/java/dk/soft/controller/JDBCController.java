package dk.soft.controller;

import dk.soft.config.DatabaseConfig;
import dk.soft.model.MatchResultDTO;
import dk.soft.model.TournamentBodyDTO;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;

public class JDBCController {

    public static void joinTournament(Context ctx) {
        TournamentBodyDTO body = ctx.bodyAsClass(TournamentBodyDTO.class);
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement statement = conn.prepareStatement("INSERT INTO tournament_registrations (tournament_id, player_id, utc_registered_at) VALUES (?, ?, ?)")) {

            statement.setInt(1, body.tournamentID());
            statement.setInt(2, body.playerID());
            statement.setTimestamp(3, Timestamp.from(Instant.now()));

            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void submitMatchResult(Context ctx) {
        System.out.println("1");
        MatchResultDTO body = ctx.bodyAsClass(MatchResultDTO.class);
        System.out.println("2");
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement statement = conn.prepareStatement("UPDATE matches SET winner_id = ? WHERE match_id = ?")) {

            statement.setInt(1, body.winnerID());
            statement.setInt(2, body.matchID());

            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}