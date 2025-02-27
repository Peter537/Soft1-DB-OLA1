package dk.soft.config;

import io.javalin.Javalin;
import io.javalin.http.ContentType;
import io.javalin.http.Handler;
import io.javalin.http.HandlerType;
import io.javalin.plugin.bundled.RouteOverviewPlugin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ApplicationConfig {

    private static final String CONTENT_TYPE = ContentType.JSON;
    private static final String CONTEXT_PATH = "/api";

    private static Javalin app;

    private static void createJavalinApp() {
        app = Javalin.create(config -> {
            config.plugins.enableDevLogging(); // enables extensive development logging in terminal
            config.http.defaultContentType = CONTENT_TYPE; // default content type for requests
            config.routing.contextPath = CONTEXT_PATH; // base path for all routes
            config.plugins.register(new RouteOverviewPlugin("")); // html overview of all registered
            // routes at "/" for api
            // documentation:
            // https://javalin.io/news/2019/08/11/javalin-3.4.1-released.html
        });
    }

    public static void addHandler(HandlerType httpMethod, String path, Handler handler) {
        if (app == null) {
            return;
        }

        app.addHandler(httpMethod, path, handler);
    }

    public static void startServer(int port) {
        if (app == null) {
            createJavalinApp();
        }

        app.start(port);
    }
}