package dk.soft.controller;

import dk.soft.config.DatabaseConfig;
import dk.soft.model.MatchResultDTO;
import dk.soft.model.TournamentBodyDTO;
import io.javalin.http.Context;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class StoredProceduresController {

    public static void joinTournament(Context ctx) {
        TournamentBodyDTO body = ctx.bodyAsClass(TournamentBodyDTO.class);
        try (Connection conn = DatabaseConfig.getConnection();
             CallableStatement statement = conn.prepareCall("CALL joinTournament(?, ?)")) {

            statement.setInt(1, body.tournamentID());
            statement.setInt(2, body.playerID());

            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void submitMatchResult(Context ctx) {
        MatchResultDTO body = ctx.bodyAsClass(MatchResultDTO.class);
        try (Connection conn = DatabaseConfig.getConnection();
             CallableStatement statement = conn.prepareCall("CALL submitMatchResult(?, ?)")) {

            statement.setInt(1, body.matchID());
            statement.setInt(2, body.winnerID());

            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}