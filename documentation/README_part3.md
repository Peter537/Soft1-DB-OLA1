Har lavet en persistScript.sql så jeg bare kan køre den når jeg vil redo persistence. Har ændret lidt i den så der findes tournaments med ferre end max anatallet af spillere så jeg kan teste at joine en full tournament vs. en åben en, osv.

## Korrekt brug

Start først med at køre [create script](../sql/create_script.sql) som indeholder tables og triggers (og deres trigger functions inkluderet også.)

derefter kan du køre [persistScriptet](./persistScript.sql) hvis du vil, da den skaber en function der kører det samme som fill_script.sql gør, bortset fra mit script har mangler så man kan tilmælde sig tournaments osv; så ikke alle tournaments bare er fulde, og den laver en function mere.

## Efter du så har kørt persist og create

- kør [functions scriptet](./functions.sql)
- Til sidst [scriptet med procedures](./procedures.sql).
