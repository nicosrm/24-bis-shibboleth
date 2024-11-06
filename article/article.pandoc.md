---
author: Johannes Merkel, Ines Rohrbach, Nico Schramm
title: Shibboleth
subtitle: Single Sign-On Login System
subject: BIS Projekt
# TODO: add `date: <date>`
lang: de-DE
papersize: a4
geometry: margin=3cm
colorlinks: true
link-citations: true
---

# Shibboleth

## Einführung

- allgemeine Worte zu Shibboleth
- Motivation
- grundlegende Begrifflichkeiten

## Funktionsweise

- Konzept
- verschiedene Komponenten

## Einsatz

- Einbindung von Shibboleth in existierendes System
- Voraussetzungen etc.
- Demo: ggf. anhand von [https://informatik.htwk-leipzig.de/seminar/](https://informatik.htwk-leipzig.de/seminar/)
    - theoretisch oder wenn noch Zeit praktisch
- Preisgestaltung (Mitgliedschaften)

## Diskussion

- Bewertung / Einschätzung von Shibboleth
- Alternativen / Konkurrenz
- Zukunft

## Zusammenfassung

## Literatur

::: {#refs}
:::

---

## Notizen

### Syntax

Quellenangaben funktionieren mittels `[@citation-key]` [@template]
und die Einbettung von Bildern so:

```
![Caption](../assets/placeholder.png)
```

![Caption](../assets/placeholder.png)

### Shibboleth allgemein

[@shibbolethShibbolethConsortium2024]

- seit Anfang der 2000er Jahre an Spitze der Identitätsmanagement-Software
- Verwendung v.a. von akademischen Institutionen, Identitätsverbände und
  kommerziellen Organisationen
- Shibboleth Consortium als Generierung von Finanzmitteln zur Erhaltung der
  Shibboleth Software
- Finanzierung durch Mitgliedschaften
    - erlaubt Unterstützung und Pflege des Systems
    - verringertes Risiko für Organisationen, die Shibboleth verwenden
- Angebote vom Consortium
    - Identity Provider (SSO)
    - Service Provider (Verwendung in Web-Anwendungen)
    - Embedded Discovery Service (Liste an Identity Providern)
    - Metadata Aggregator (Verarbeitung von Metadaten bei Verwendung mehrerer
      Identity Providern)
- Mitglieder: u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology [@shibbolethOurMembers2024] (Auswahl)

[@cantorConsortiumFAQShibboleth2023]

- Open-Source-Softwareprojekt
- entwickelt Software zur Unterstützung von verschiedenen Standards zur
  Unterstützung von föderiertem Web-Single-Sign-On
    - bspw. SAML, OpenID Connect
- effiziente Anmeldung bei Websites
- _Identity Provider_ als zentrale Komponenten
    - Login-Service für Anwendungen verschiedener Organisationen
- explizit kein Hosting oder Service, "nur" Software
- eher Mittel zur Verwaltung des Zugangs zu Ressourcen anstelle von
  IP-Beschränkungen oder Proxy-Servern

<br>

- kein Service Provider, sondern _Identity Provider_
- Unterstützung von föderiertem Login zu bestimmten Web-Services bzw.
  -Plattformen, meist SAML
- Einloggen mittels lokalen (bereits existierenden) Anmeldedaten des lokalen
  Login-Servers statt ausgegebenem Passwort oder anderem SSO-Anbieter
- Zielgruppe: Hochschulwesen
    - Verbänden von Universitäten und Dienstleistern
    - föderierte Anmeldung mittels SAML
- direkter Hinweis, dass nicht für Einsteiger in das Thema gedacht
- "We make complex software for complex needs and we assume a lot of knowledge
  up front, as is common with open source."

<br>

- verfügbar unter Apache 2.0 Lizenz
- Open-Source, kann jede:r downloaden / installieren
- (teilweise) bezahlter technischer Support durch Mitglied des Consortiums
  möglich (siehe [Technical Support Options](https://shibboleth.atlassian.net/wiki/spaces/consort/pages/1059684709/Technical+Support+Options))
- Finanzierung basierend auf freiwilligen Spenden und Mitgliedschaften
    - bei Einsatz, v.a. kommerziell, vorgesehen
    - bezahlte [Mitgliedschaften](#shibboleth-consortium-mitgliedschaften)
    - stellt keine Instanz zu Verfügung oder Ähnliches
    - keine Voraussetzung für Verwendung der Software

### Shibboleth Ziele

[@shibbolethShibbolethConceptsUSGoalReq2018]

- Bestehenden Authentifikationmechanismen können für webbasierte Ressourcen 
  benutzt werden
    - keine neuen Anmeldedaten pro Ressource
    - keine Verwaltung von Anmeldedaten bei den Ressourcen notwendig
- Benutzerinformationen können zentral verwaltet werden
    - Ressourcen erhalten Änderungen bei der Anmeldung
    - keine Dopplung/Kopie von Daten wird von der Ressourcen verwaltet
- Bekanntgabe von Benutzerinformationen erfolgt nicht durch die Ressource
    - Kontrolle liegt bei der Organisation oder dem/der Nutzer:in
    - keine zusätzlichen Sicherheitsmaßnahmen auf Seitens der Ressource notwendig 

### SAML

### Konzept

[@shibbolethShibbolethConcepts2023]

- SAML als primäres Protokoll, welches durch IdP unterstützt wird
    - als einziges von SP unterstützt
- Shibboleth Software besteht aus 3 Hauptkomponenten
    - _Identity Provider_ (IdP)
        - Authentifizierung
        - Weitergabe von Nutzer-Informationen an SP
        - innerhalb der _Home Organisation_ (Verwaltung des Nutzerkontos)
    - _Service Provider_ (SP)
        - Schutz von Online-Ressourcen
        - Verwendung der Informationen vom IdP
        - innerhalb der _Resource Organisation_
    - _Discovery Service_ (DS)
        - Unterstützung des SP bei Ermittlung des IdP des Nutzers
        - Standort überall im Web möglich
        - nicht in allen Anwendungsfällen nötig
- TODO: [@robinsDemystifyingShibbolethAdapting2024]

#### Basic Interaction

[@shibbolethShibbolethConcepts2023]

![Basic Interaction [vgl. @shibbolethShibbolethConcepts2023]\label{fig:basic-interaction}](../assets/basic_interaction.drawio.svg)

Grundlegende Interaktionen wie in \autoref{fig:basic-interaction} dargestellt

1. SP erkennt Nutzer, der versucht, auf eingeschränkte Inhalte zuzugreifen
2. SP generiert Authentifizierungsanfrage, Senden der Anfrage und des Nutzers
   an IdP des Nutzers
3. IdP authentifiziert Nutzer, sendet Authentifizierungsantwort und Nutzer
   zurück an SP
4. SP: Verifikation der Antwort des IdP, Senden einer Anfrage an Ressource, die
   ursprünglich angefragten Inhalt zurückgibt

- TODO: weitere Inhalte auf verlinkter Seite

#### System Flow

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Hauptkomponenten: IdP und SP
  - IdP: Bereitstellung von Informationen über Nutzenden an Services
  - SP: Sammeln von Informationen über Nutzenden zum Schutz der Ressourcen
- typisches Szenario
  - Zugriff einer geschützten Resource über Webbrowser
  - Authentifizierung beim IdP
  - Navigation zurück zur Ressource im eingeloggten Zustand

##### Zugriff auf Geschützte Ressource

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Zugriff auf geschützte Ressource
- SP fängt Anfrage ab
- Definition des Pfad der zu schützenden Ressource in Web-Server-Konfiguration
  - bspw. [`httpd.conf`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335062/Apache)
  - oder [`shibboleth2.xml`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2063695926/SPConfig) in [`<RequestMap>`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334391/RequestMapper)

##### SP bestimmt IdP und Sendet Authentifizierungsanfrage

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Auswahl eines [Session Initiators](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334685/SessionInitiator) durch SP
  - basierend auf Projekt-Konfiguration
- Session Initiator
  - verantwortlich für Bestimmung des IdP des Nutzenden und dessen Protokoll
- Provider kommunizieren Profile Preferences gegenseitig via Austausch von [SAML-Metadaten](#metadaten)

<br>

- Prozess der IdP Bestimmung: [*IdP Discovery*](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263/IdPDiscovery)
- verschiedene Konfigurationsmöglichkeiten, Interaktionen, Cookies etc.
- "A SessionInitiator might supply a text entry box, refer the user to a locally or remotely deployed discovery service (DS), or select a fixed IdP based on the resource requested."

<br>

- SP speichert URL der angeforderten Ressource mittels "Relay State" Mechanismus
- konfiguriert über `relayState` Property im [`<SessionInitiator>`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334685/SessionInitiator) Element
- Standard-Mechanismus verwendet nicht mehr Cookies, aber häufig noch in Legacy-Systemen
  - Senden eines State-Management-Cookies mit URL der Ressource zusammen mit Anfrage an IdP

##### Nutzerauthentifizierung beim IdP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Ergebnis des vorherigen Schritts: Authentifizierungsanfrage vom SP an IdP
- Format abhängig vom Protokoll und Binding/Profil, welches vom SP ausgewählt wurde
- Authentifizierungsanfrage über Client an Endpunkt des IdP (*Single Sign-On Service*)
  - via GET oder POST
- Untersuchung der Anfrage durch IdP
- Entscheidung über Authentifizierungsmethode des Nutzenden basierend auf Protokoll für SP ([`relaying-party.xml`](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726167/RelyingPartyConfiguration))
- Weiterleitung des Nutzenden an kompatiblen Login-Flow
- Authentifizierung mittels konfigurierter Methode
- schließlich Übergabe der Kontrolle an Profil-Implementierung inkl. ermitteltem Nutzername
- Cookies vom IdP (set/read)
  - IdP versucht während Auth.-Prozess meist Cookies zu lesen oder zu setzen (je nach Methode)
  - IdP erstellt Session Cookie
    - zum Tracking des Fortschritts durch die Anfrageschritte
    - Erhaltung einer länger gültigen Verbindung für SSO-Zwecke
  - ggf. weitere Cookies je nach Login-Handler

##### Antwort des IdP an SP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- IdP verwendet Namen des *Principals*, SP, Protokoll und Binding/Profile zur Bestimmung, welche Information zum SP zurückzuschicken ist und Art des Packaging
- IdP sammelt zunächst Attribute für Nutzenden über [Attribut-Resolver](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726159/AttributeResolverConfiguration)
- Sammeln von Nutzerdaten von allen Backend-Quellen (ggf. Umwandlung), Anhängen von Encodern an jedes Attribut
- Weiterleitung der Attribute durch [Attribut-Filter](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726157/AttributeFilterConfiguration)
  - ggf. Reduzierung der tatsächlich in Antwort verwendeten Attribute
- Attribute meist abhängig von SP und *Principal* zum Datenschutz
- resultierende Informations ggf. nur "jemand hat sich erfolgreich authentifiziert"
- Packen der Nutzerdaten in geeignete Form für Antwort
  - Verwendung des vorher angehängten Encoders, meist in einer SAML Assertion
  - ggf. Signieren der Assertion mit Schlüssel des IdPs
  - ggf. Verschlüsselung mittels Schlüssel des SPs $\Rightarrow$ Sicherheit & Privatsphäre
- Platzieren der Assertion (Referenz darauf auch *Artefact*) in Antwort
  - Weiterleitung durch Browser des Clients zurück an SP zum Endpunkt ([*Assertion Customer Service*](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/958759025/AssertionConsumerService))

##### Zurück zum SP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Browser liefert Antwort vom IdP an Endpunkt eines Assertion Consumer Services (ACS) im SP
- ACS Implementierung
  - Dekodierung der Nachricht
  - ggf. Entschlüsselung der Assertion
  - Durchführung von Security Checks
- SP
  - Extraktion der Attribute und anderer Informationen aus Nachricht
  - Erstellung einer neuen User-Session
  - Übersetzung der Attribute in cache-bare Form mittels [*Attribute Extractor*](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334409/AttributeExtractor) vom SP
  - Weiterleitung durch [*Attribute Filter*](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334516/AttributeFilter)
  - Caching in neuer Session mit anderen relevanten Infos
- nach Erstellung der Session: Bestimmung der Zieladresse für Browser über *Relay State Information* vom IdP
- Cookie, der vom SP gelesen wird
  - "The 'relay state' information returned by the IdP, if any, will have been created by the SP and if using a cookie, will point to a specially named cookie that should accompany the authentication response supplied to the ACS endpoint in this step. This is the cookie set in Step 2 above. If this cookie is missing (or if no relay state exists at all), the associated application's homeURL property is substituted as a fall back."
- Ressource-Location final bestimmt $\Rightarrow$ Weiterleitung des Browsers dorthin durch SP
- Cookie, welcher vom SP gesetzt wurde
  - "The SP will associate the browser with the newly created session by sending a cookie containing a session key to the client as part of the redirection to the resource."

##### Zurück zur geschützten Ressource

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- finaler Schritt
- Weiterleitung des Browsers zur geschützten Ressource, auf welche in Schritt 1 zugegriffen wurde
- dieses Mal Zugriff im Kontext einer Session, welche im [Session Cache](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334650/SessionCache) vom SP gespeichert wurde
- Cookie, welche vom SP gelesen wurde
  - "The cookie containing the session key set in the previous step is expected to accompany all subsequent requests for protected resources. This is why it's essential that the ACS endpoint and resource location share a virtual host; if they do not, the session cookie set in the previous step won't be returned by the browser, and looping typically results."
- Annahme: Session wurde anerkannt und validiert vom SP
  - alle anwendbare [Access Control](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335430/AccessControl) Plugins werden durchgesetzt
  - Annahme: Zugriff gewährt
    - Anfrage wird durchgeführt mit allen gecached Attributen, welche an Anfrage hängen

#### [Metadaten](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645459)

- Bereitstellung der Configuationsdaten in der Kommunikaton zwischen SP und IdP
- Typischerweise in XML
- Basiert auf der SAML 2.0 Metadata specification standardized by OASIS
- Wah. zu spezifisch für eine allgemeine Erklärung von Shibboleth

#### [Sessions](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645433)

- Der Prozess beinhaltet mehrere Sessions, zwischen user und service
- In den meisten Fällen durch cookies realisiert
- Zur Realisierung von Single Sign-On und damit einhergehender vermeidung weiterer Authentisierungen
- Jede Anwendung sollte eine eigene Session über den Browser haben
- Sessions sind eigenständig und der Ablauf ist unabhäning von den anderen
- Sonderfall: Single-log-out kann ein Problem sein, wenn Sessions miteinander verbunden werden


#### Name Identifiers

[@shibbolethShibbolethConceptsNameIdentifiers2020]

- Dargestellt durch `<NameID>`-Element von SAML2
    - nicht festgelegt was als *name identifier* verwendet wird
    - erschwert Interoperabilität

- TODO: weitere Informationen von der verlinkten Seite

#### Weiteres

- TODO: [Glossar](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645488/Glossary)
    - hier auch hilfreiche Definition gegeben, falls noch fehlend
- ggf. [weitere Konzepte](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/overview#More-Concepts)
- TODO: Active-Directory als Vergleich zu Shibboleth

#### Identity Provider 5

- TODO: [https://shibboleth.atlassian.net/wiki/spaces/IDP5/overview](https://shibboleth.atlassian.net/wiki/spaces/IDP5/overview)

#### Service Provider V3

- TODO: [https://shibboleth.atlassian.net/wiki/spaces/SP3/overview](https://shibboleth.atlassian.net/wiki/spaces/SP3/overview)

#### Embedded Discovery Service

- TODO: [https://shibboleth.atlassian.net/wiki/spaces/EDS10/overview](https://shibboleth.atlassian.net/wiki/spaces/EDS10/overview)

### Shibboleth Consortium Mitgliedschaften

[@shibbolethShibbolethConsortium2024]

- Finanzierung durch Mitgliedschaften
- erlaubt Unterstützung und Pflege des Systems
- verringertes Risiko für Organisationen, die Shibboleth verwenden
- u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology [@shibbolethOurMembers2024] (Auswahl)

<br>

- TODO: [https://www.shibboleth.net/membership/](https://www.shibboleth.net/membership/)
