# The LijOLo-Demo-Project

Das Projekt zeigt den Einsatz von LiquiBase, jOOQ und LocalStack. In diesem Repo sind die folgenden Elemente defioniert:

* Konfiguration der Datenbank
* Initiale Daten für DB und JUnit-Tests
* Bereitstellen der DTOs
* Record & Jooq-Klassen (werden während des Builds ewrzeugt)
* Mapper & Unmapper
* UpdateRunner für den "produktiven" Datenbank-Update
* DockerCompose dür die Erstellung des notwendigen Envirements

## Hinweis

Es wird kein Artifakt erstellt und ins SNAPSHOT-Repo gepushed. Um die Artefakte zu erzeugen, muss erst das Envirement
erzeugt werden (unter Verwendung der 'docker compose'-commands.

Im Anschluss sind die Artefakte via `mvn clean install` zu bauen.

## Requirements

Um das Projekt erfolgreich ausführen zu können, sind folgende Installation auf dem lokalen Rechner erforderlich:

* Java 21
* Docker
* Maven 3
* AWS CLI

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
2. Folgende Zeile muss in dieye Datei eingetragen werden: **api.version=1.44**

Im Anschluss ist der Build wieder lauffähig.

















