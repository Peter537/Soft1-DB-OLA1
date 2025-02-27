package dk.soft;

import dk.soft.config.ApplicationConfig;
import dk.soft.controller.JDBCController;
import dk.soft.controller.StoredProceduresController;
import io.javalin.http.HandlerType;

public class Main {

    public static void main(String[] args) {
        System.out.println("Hello world!");
        ApplicationConfig.startServer(7070);
        ApplicationConfig.addHandler(HandlerType.POST, "/tournament/join", StoredProceduresController::joinTournament);
        ApplicationConfig.addHandler(HandlerType.POST, "/tournament/join/jdbc", JDBCController::joinTournament);
        ApplicationConfig.addHandler(HandlerType.POST, "/match/result", StoredProceduresController::submitMatchResult);
        ApplicationConfig.addHandler(HandlerType.POST, "/match/result/jdbc", JDBCController::submitMatchResult);
    }
}