# The LijOLo-Demo-Project

Das Projekt zeigt den Einsatz von LiquiBase, jOOQ und LocalStack. Dieses Repo enthält den Teil, der für die Datenbank-Struktur, die Daten-Objekte und den DB-Updater bereit stellt
und  als Basis für das iljolo-Sservice-Repo dient.

Es wird kein Artifakt erstellt und ins SNAPSHOT-Repo gepushed. Von daher muss der Build immer lokal via `mvn clean install` erfolgen.

## Requirements

Um dsa Projekt erfolgreich aszuführen, werden folgende Lokale Installationen erwartet:

* Java 21
* Docker
* Maven 3
* AWS CLI

## Vorbereitung

Im ersten Schritt folgendes Command ausführen:

```bash
docker volume create pg-admin-config
```

### Datenbank ausführen

**Achtung:** Die Postgres-Datenbank läuft auf Port: 5462 um Konflikten mit anderen Installationen zu vermeinden

#### Datenbank starten

```bash
docker compose up
```

#### Datenbank stoppen

```bash
docker compose stop
```

#### Datenbank stoppen und Daten löschen

```bash
docker compose down
```

## Erzeugen der Artifakte

Mittels den Befehl: 

```bash
mvn clean install
```

werden die für die Service-Komponente erforderlichen Artifakte ertellt.














