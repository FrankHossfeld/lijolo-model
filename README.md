# The LijOLo-Demo-Project

Das Projekt zeigt den Einsatz von LiquiBase, jOOQ, Testcontainer und LocalStack in der Software-Entwicklung.
Ziel ist eine lokale Cloud-Entwicklung mit automatisierten Tests zu implementieren.

In diesem Repo befinden sich die erforderlichen Daten für die Erstellung der DB, die DTOs, Mapper sowie die Klassen für den automatisierten 
Datenbank-Update. Folgenden Elemente defioniert das Repo:

* Konfiguration der Datenbank
* Initiale Daten für DB und JUnit-Tests
* Bereitstellen der DTOs
* Record & Jooq-Klassen (werden während des Builds ewrzeugt)
* Mapper & Unmapper
* UpdateRunner für den "produktiven" Datenbank-Update
* DockerCompose dür die Erstellung des notwendigen Envirements

**Die Build-Pipeline erstellt kein Deployable!** 

Die Artefakte sind lokal via `mvn clean install` zu erstellen!

## Requirements

Um mit dem Projekt lokal arbeiten und erfolgreich ausführen zu können, sind folgende Installation erforderlich:

* Java 21 (https://adoptium.net/de/temurin/releases?version=21&os=any&arch=any)
* Docker (https://www.docker.com/products/docker-desktop/)
* Maven 3 (https://maven.apache.org/download.cgi?.)
* AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Vorbereitung

Zunächst muss die Infrastruktur aufgebautwerden. Im ersten Schritt ist folgendes Command auszuführen:

```bash
docker volume create pg-admin-config
```

Nach der Erstellung des Volumes, geht es mit der Infrastruktur weiter:

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


## Trouble-Shooting

### Docker ab Version 4.52.0

Ab der Version 4.52.0 der Docker Desktop Software ist die minimale Version der API 1.44,
in der aktuellen Version des Testcontainers 1.32. Dadurch schlägt der Nuild fehlt. (siehe
Issue hier: https://github.com/testcontainers/testcontainers-java/issues/11235) Das Problem 
lässt sich umgehen, in dem man entweder eine ältere Version des Docker Desktops verwendet (< 4.52.0),
die hier geladen werden kann: https://docs.docker.com/desktop/release-notes/) oder folgenden Fix
vornimmt: 

1. Erzeugen  einer Datei mit Namen **.docker-java.properties**
2. Folgende Zeile muss in diese Datei eingetragen werden: **api.version=1.44**

Im Anschluss ist der Build wieder lauffähig.

















