# Einführung

- allgemeine Worte zu Shibboleth
- Motivation
- grundlegende Begrifflichkeiten

# Funktionsweise

- Konzept
- verschiedene Komponenten

# Einsatz

- Einbindung von Shibboleth in existierendes System
- Voraussetzungen etc.
- Demo: ggf. anhand von <https://informatik.htwk-leipzig.de/seminar/>
  - theoretisch oder wenn noch Zeit praktisch
- Preisgestaltung (Mitgliedschaften)

# Diskussion

- Bewertung / Einschätzung von Shibboleth
- Alternativen / Konkurrenz
- Zukunft

# Zusammenfassung

# Literatur

<div id="refs">

</div>

------------------------------------------------------------------------

# Notizen

## Syntax

Quellenangaben funktionieren mittels `[@citation-key]` (**template?**)
und die Einbettung von Bildern so:

    ![Caption](../assets/placeholder.png)

<figure>
<img src="../assets/placeholder.png" alt="Caption" />
<figcaption aria-hidden="true">Caption</figcaption>
</figure>

## Shibboleth allgemein

(**shibbolethShibbolethConsortium2024?**)

- seit Anfang der 2000er Jahre an Spitze der
  Identitätsmanagement-Software
- Verwendung v.a. von akademischen Institutionen, Identitätsverbände und
  kommerziellen Organisationen
- Shibboleth Consortium als Generierung von Finanzmitteln zur Erhaltung
  der Shibboleth Software
- Finanzierung durch Mitgliedschaften
  - erlaubt Unterstützung und Pflege des Systems
  - verringertes Risiko für Organisationen, die Shibboleth verwenden
- Angebote vom Consortium
  - Identity Provider (SSO)
  - Service Provider (Verwendung in Web-Anwendungen)
  - Embedded Discovery Service (Liste an Identity Providern)
  - Metadata Aggregator (Verarbeitung von Metadaten bei Verwendung
    mehrerer Identity Providern)
- Mitglieder: u.a. Stanford University, University of Oxford, DFN
  Verein, Massachusetts Institute of Technology
  (**shibbolethOurMembers2024?**) (Auswahl)

(**cantorConsortiumFAQShibboleth2023?**)

- Open-Source-Softwareprojekt
- entwickelt Software zur Unterstützung von verschiedenen Standards zur
  Unterstützung von föderiertem Web-Single-Sign-On
  - bspw. SAML, OpenID Connect
- effiziente Anmeldung bei Websites
- *Identity Provider* als zentrale Komponenten
  - Login-Service für Anwendungen verschiedener Organisationen
- explizit kein Hosting oder Service, “nur” Software
- eher Mittel zur Verwaltung des Zugangs zu Ressourcen anstelle von
  IP-Beschränkungen oder Proxy-Servern

<br>

- kein Service Provider, sondern *Identity Provider*
- Unterstützung von föderiertem Login zu bestimmten Web-Services bzw.
  -Plattformen, meist SAML
- Einloggen mittels lokalen (bereits existierenden) Anmeldedaten des
  lokalen Login-Servers statt ausgegebenem Passwort oder anderem
  SSO-Anbieter
- Zielgruppe: Hochschulwesen
  - Verbänden von Universitäten und Dienstleistern
  - föderierte Anmeldung mittels SAML
- direkter Hinweis, dass nicht für Einsteiger in das Thema gedacht
- “We make complex software for complex needs and we assume a lot of
  knowledge up front, as is common with open source.”

<br>

- verfügbar unter Apache 2.0 Lizenz
- Open-Source, kann jede:r downloaden / installieren
- (teilweise) bezahlter technischer Support durch Mitglied des
  Consortiums möglich (siehe [Technical Support
  Options](https://shibboleth.atlassian.net/wiki/spaces/consort/pages/1059684709/Technical+Support+Options))
- Finanzierung basierend auf freiwilligen Spenden und Mitgliedschaften
  - bei Einsatz, v.a. kommerziell, vorgesehen
  - bezahlte [Mitgliedschaften](#shibboleth-consortium-mitgliedschaften)
  - stellt keine Instanz zu Verfügung oder Ähnliches
  - keine Voraussetzung für Verwendung der Software

## SAML

## Konzept

(**shibbolethShibbolethConcepts2023?**)

- SAML als primäres Protokoll, welches durch IdP unterstützt wird
  - als einziges von SP unterstützt
- Shibboleth Software besteht aus 3 Hauptkomponenten
  - *Identity Provider* (IdP)
    - Authentifizierung
    - Weitergabe von Nutzer-Informationen an SP
    - innerhalb der *Home Organisation* (Verwaltung des Nutzerkontos)
  - *Service Provider* (SP)
    - Schutz von Online-Ressourcen
    - Verwendung der Informationen vom IdP
    - innerhalb der *Resource Organisation*
  - *Discovery Service* (DS)
    - Unterstützung des SP bei Ermittlung des IdP des Nutzers
    - Standort überall im Web möglich
    - nicht in allen Anwendungsfällen nötig

### Basic Interaction

(Shibboleth 2023)

<figure>
<img src="../assets/basic_interaction.drawio.svg"
alt="Basic Interaction (vgl. Shibboleth 2023)" />
<figcaption aria-hidden="true">Basic Interaction <span class="citation"
data-cites="shibbolethShibbolethConcepts2023">(vgl. Shibboleth
2023)</span></figcaption>
</figure>

Grundlegende Interaktionen wie in dargestellt

1.  SP erkennt Nutzer, der versucht, auf eingeschränkte Inhalte
    zuzugreifen
2.  SP generiert Authentifizierungsanfrage, Senden der Anfrage und des
    Nutzers an IdP des Nutzers
3.  IdP authentifiziert Nutzer, sendet Authentifizierungsantwort und
    Nutzer zurück an SP
4.  SP: Verifikation der Antwort des IdP, Senden einer Anfrage an
    Ressource, die ursprünglich angefragten Inhalt zurückgibt

- TODO: weitere Inhalte auf verlinkter Seite

### Identity Provider 5

- TODO: <https://shibboleth.atlassian.net/wiki/spaces/IDP5/overview>

### Service Provider V3

- TODO: <https://shibboleth.atlassian.net/wiki/spaces/SP3/overview>

### Embedded Discovery Service

- TODO: <https://shibboleth.atlassian.net/wiki/spaces/EDS10/overview>

## Shibboleth Consortium Mitgliedschaften

(**shibbolethShibbolethConsortium2024?**)

- Finanzierung durch Mitgliedschaften
- erlaubt Unterstützung und Pflege des Systems
- verringertes Risiko für Organisationen, die Shibboleth verwenden
- u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology (**shibbolethOurMembers2024?**)
  (Auswahl)

<br>

- TODO: <https://www.shibboleth.net/membership/>
