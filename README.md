# Esport Turneringsplatform

## Gruppe

- Oskar (Ossi-1337, cph-oo221)
- Peter (Peter537, cph-pa153)
- Yusuf (StylizedAce, cph-ya56)

## Dokumentation for løsning

### SQL-script med databaseoprettelse

Vi opretter vores database via PgAdmin, og derinde kan man ikke lave et script til at oprette databasen, derfor har vi selv manuelt oprettet databasen, og i create-scriptet (under her), udeladt `CREATE DATABASE esport_db;` da vi ikke kan køre det i PgAdmin.

Vi har lavet et [sql/create_script.sql](/sql/create_script.sql) som opretter tabellerne.

Vi har et [sql/fill_script.sql](/sql/fill_script.sql) til at fylde tabellerne med data.

### SQL script med de 15 SQL-forespørgsler.

I fill-scriptet var alle sat på 1.000 rating som er start-værdien, men fordi på dette tidspunkt vi ikke har simuleret nogle matches så er alle spillere stadig på 1.000 rating, så de to queries der viser de 5 bedst rangerede spillere og gennemsnitlig rating for alle spillere vil give det samme resultat.

Derfor har vi til denne opgave været inde i databasen og ændret nogle spilleres rating, så de har forskellige ratings ud fra denne query:

```sql
UPDATE players
SET rating = FLOOR(RANDOM() * 401) + 800;
```

SQL-scriptet til de 15 SQL-forespørger er lavet i [sql/sql_queries.sql](/sql/sql_queries.sql).

Dokumentationen for de 15 SQL-forespørgsler er lavet i [documentation/queries.md](/documentation/queries.md).

### Stored Procedures, Functions og Triggers.

SQL-scriptsne ligger i [sql/functions.sql](/sql/functions.sql) og [sql/procedures.sql](/sql/procedures.sql). Og triggers ligger inde i [sql/create_script.sql](/sql/create_script.sql).

Dokumentationen for de 3 er lavet i [documentation/part3.md](/documentation/part3.md).

### Applikation som angivet i opgave 4.

Koden til applikationen er lavet i Java ligger i [/src-mappen](/src/).

Dokumentationen for applikationen er lavet i [documentation/app.md](/documentation/app.md).

### Kort redegørelse med jeres betragtninger om brugen af SQL programmering (fordele og ulemper).

**Fordele:**

- Når vi skal gemme data på en struktureret relationel måde, så er SQL en god måde at gøre det på, da det er nemt at læse og skrive data til databasen i forhold til f.eks. at læse og skrive data til en fil.
- Det er godt med et centralt sted at gemme data, og SQL har mange funktionaliteter til at gøre dataen mere sikker.
- Queries er meget tæt på 'normalt' sprog, så det er nemt at forstå queries.

**Ulemper:**

- SQL-dialekter er forskellige, så nogle har nogle features som andre ikke har, samt nogle features skal kodes på forskellige måder
- Hvis man har en stor database kan det hurtigt blive uoverskueligt at finde rundt i, hvilket gør det svært at lave queries.
- Det er svært at teste databaser hvis man har meget af sin forretningslogik i databasen.
