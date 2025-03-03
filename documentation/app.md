## Stored Procedures

**Endpoint:** `/tournament/join`

Vi kalder endpointed med et turnerings ID og et spiller ID som json body.

![alt text](/images/app/tournament-procedure-req.png)

Før Endpointed blev kaldt, kan vi se at der er 40 rækker i databasen, og at der ikke er nogle spillere tilmeldt turnering 8.

![alt text](/images/app/tournament-before.png)

Vi kan se at spiller 2 er blevet tilmeldt turnering 8.

![alt text](/images/app/tournament-procedure-after.png)

**Endpoint:** `/match/result`

Vi kalder endpointed med et match ID og et spiller ID som er vinderen af kampen, fordi kampen er allerede oprettet det er bare resultatet der mangler.

![alt text](/images/app/match-procedure-req.png)

Man kan se at match ID 22 ikke har nogle winner_id associeret med sig.

![alt text](/images/app/match-before.png)

Vi kan se at spilleren med ID 10 vandt kampen, som var det vi sendte med i vores request.

![alt text](/images/app/match-procedure-after.png)

## JDBC

**Endpoint:** `/tournament/join/jdbc`

Vi kalder endpointed med et turnerings ID og et spiller ID som json body ligesom med vores procedure's endpoint.

![alt text](/images/app/tournament-jdbc-req.png)

Ligesom før, kan vi se at der er 40 rækker i databasen, og at der ikke er nogle spillere tilmeldt turnering 8.

![alt text](/images/app/tournament-before.png)

Vi kan se at spiller 1 er blevet tilmeldt turnering 8.

![alt text](/images/app/tournament-jdbc-after.png)

**Endpoint:** `/match/result/jdbc`

Vi kalder endpointed med et match ID og et spiller ID som er vinderen af kampen, fordi kampen er allerede oprettet det er bare resultatet der mangler.

![alt text](/images/app/match-jdbc-req.png)

Ligesom før, kan vi se at match ID 21 ikke har nogle winner_id associeret med sig.

![alt text](/images/app/match-before.png)

Vi kan se at spilleren med ID 6 vandt kampen, som var det vi sendte med i vores request.

![alt text](/images/app/match-jdbc-after.png)
