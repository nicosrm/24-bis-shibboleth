---
author: Johannes Merkel, Ines Rohrbach, Nico Schramm
title: Shibboleth
subtitle: Single Sign-On Login System
subject: BIS Projekt
date: 24. Januar 2024
lang: de-DE
papersize: a4
geometry: margin=3cm
colorlinks: true
link-citations: true
listings: true
sectionsDepth: -1
secPrefix:
  - "Abschnitt"
  - "Abschnitte"
figureTitle: "Abbildung"
figPrefix:
  - "Abbildung"
  - "Abbildungen"
header-includes: |
  \definecolor{codegray}{rgb}{0.5,0.5,0.5}
  \definecolor{backcolour}{rgb}{0.95,0.95,0.95}
  \lstset{backgroundcolor=\color{backcolour},
          frame=single, rulecolor=\color{codegray},
          numbers=left, numberstyle=\tiny\color{codegray},
          breaklines=true, basicstyle=\ttfamily\small,
          aboveskip=1.5em}
  \usepackage{float} \makeatletter\def\fps@figure{H}\makeatother
  \usepackage{caption} \captionsetup{format=hang}
---

# Shibboleth

## Einführung

Heutzutage ist der Zugriff auf eine Vielzahl von Online-Diensten und -Ressourcen erforderlich. Vor allem in föderierten Systemen sind *Single-Sign-On*-Systeme (SSO) weit verbreitet. Diese ermöglichen es, dass Benutzer:innen nach einmaliger Authentifizierung Zugriff auf verschiedene Anwendungen und Dienste haben, d.h. ohne sich mehrfach anmelden zu müssen [@switchIntroductionSWITCHaai2024].

*Shibboleth* ist ein Open-Source-Softwareprojekt für Web-basiertes SSO und Identitätsmanagement für föderierte Systeme, wie beispielsweise akademische Institute, Identitätsverbände oder kommerzielle Organisationen. Verschiedene Komponenten verwalten die Authentifizierung sowie den Zugriff auf geschützte Ressourcen [@shibbolethShibbolethConsortium2024; @cantorConsortiumFAQShibboleth2023; @shibbolethOurMembers2024].

Vor allem an akademischen Institutionen, wie der Hochschule für Technik, Wirtschaft und Kultur Leipzig (HTWK), wird Shibboleth eingesetzt. Bei der HTWK ermöglicht Shibboleth im Verbund des *Deutschen Forschungsnetzes* (DFN) beispielsweise ein sicheres Identitätsmanagement sowie ein Login mit nur einem Benutzernamen und Passwort bei verschiedenen Web-Diensten [@switchIntroductionSWITCHaai2024; @hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen; @shibbolethOurMembers2024].

So ist es an der HTWK möglich, sich unter anderem bei den E-Learning Plattformen [*OPAL*](https://www.bps-system.de/opal-lernplattform/) und [*AutoTool*](https://git.imn.htwk-leipzig.de/waldmann/autotool/), der HTWK-Webseite, den verschiedenen GitLab-Instanzen, der Hochschulbibliothek oder verschiedenen wissenschaftliche Ressourcen wie *IEEE Xplore* und *SpringerLink* mit denselben Logindaten anzumelden [@switchIntroductionSWITCHaai2024; @hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen]. Die Authentifizierung wird über einen zentralen *Identity Provider* durchgeführt und vereinfacht die Nutzung der Services durch Studierende und Mitarbeitende. Ebenso ist eine einfachere und sicherere Administration des Identitätsmanagements möglich [@switchIntroductionSWITCHaai2024].

Der folgende Artikel gibt einen Überblick über Shibboleth. Zunächst werden die grundlegenden Begriffe erläutert, gefolgt von einer detaillierten Darstellung des Prozessablaufs anhand eines Beispielszenarios. Weiterhin werden die Vor- und Nachteile im Vergleich zu ähnlichen Softwarelösungen diskutiert. Abschließend wird ein Fazit gezogen.


## Grundlegende Begriffe {#sec:grundlegende-begriffe}

Im folgenden Abschnitt werden verschiedene theoretische Grundlagen gelegt und zentrale Begriffe erläutert. Zunächst werden die zentralen Komponenten sowie der grundlegende Prozessablauf des Shibboleth-Systems erläutert. Anschließend wird ein Beispiel-Szenario skizziert, auf welchem die Erklärung in @sec:prozessablauf basiert.


### Komponenten

Das Shibboleth-System verwendet insgesamt drei Hautkomponenten während des Login-Prozesses:

1. *Identity Provider* (IdP) sind für die Authentifizierung der Benutzer:innen zuständig. Sie geben die Informationen über diese an den jeweiligen Service Provider weiter. IdPs werden dabei in der Home-Organisation der jeweiligen Benutzer:innen verwaltet, d.h. dort, wo das entsprechende Benutzerkonto befindet, wie beispielsweise Bildungs- und Forschungseinrichtungen [@shibbolethShibbolethConcepts2023; @dfnDFNAAIDokumentationEinfuhrung].

2. *Service Provider* (SP) dienen dem Schutz der eigentlich angefragten geschützten Online-Ressourcen und werden innerhalb der sogenannten *Ressource Organisation* verwaltet. Sie prüfen die Authentifizierung vom IdP, autorisieren die Benutzer:innen basierend auf den erhaltenen Informationen und stellen schließlich den Zugriff auf die angefragte Ressource bereit [@shibbolethShibbolethConcepts2023; @shibbolethServiceProviderApplication2021; @shibbolethServiceProviderProtectContent2021]. Service Provider können beispielsweise Content-Provider, E-Learning-Plattformen, oder Bibliotheken sein [@dfnDFNAAIDokumentationEinfuhrung].

3. *Discovery Services* (DS) unterstützen Service Provider bei der Ermittlung des Identity Providers der Benutzer:innen, da die Ressource keine Information über die Home-Organisation hat. Sie stellen einen Service zur Präsentation eines Standard-Interfaces dar, mit welchem die Benutzer:innen ihre Home-Organisation (und damit IdP) auswählen können. Somit stellen sie einen *Where Are You From Service* (WAYF) dar. DS können mit der Ressource verbunden oder als zentraler, geteilter Service betrieben werden [@shibbolethShibbolethConcepts2023; @shibbolethIdPDiscoveryShibbolethConcepts2020; @switchSimpleDemoSwitchAAI2024].


### Grundlegender Ablauf

Der grundlegende Ablauf zum Zugriff auf eine geschützte Ressource verläuft wie folgt: Zunächst fragt ein:e Benutzer:in den Zugriff auf eine bestimmte geschützte Ressource bei einem Service Provider an. Dieser leitet zum Discovery Service weiter, mit welchem der zuständige Identity Provider des oder der Benutzer:in ermittelt wird. Anschließend generiert der SP eine Authentifizierungsanfrage und sendet diese an den ermittelten IdP. Bei diesem findet die Authentifizierung statt. Der SP verifiziert die Authentifizierungsantwort vom IdP und sendet eine Anfrage an die Ressource, welche den ursprünglich angefragten Inhalt zurückgibt [@shibbolethShibbolethConcepts2023; @switchExpertDemoSWITCHaai2024a; @michelsIdentityManagementUnd]. Der Ablauf ist in @fig:grundlegender-ablauf skizziert.

![Grundlegender Ablauf (nach Beschreibungen aus [ @shibbolethShibbolethConcepts2023; @switchExpertDemoSWITCHaai2024a; @michelsIdentityManagementUnd])](../assets/basic_interaction_article.drawio.svg){#fig:grundlegender-ablauf}


### Szenario {#sec:szenario}

In den weiterführenden Abschnitten soll das folgende Szenario genauer beleuchtet werden. Eine Benutzerin der Universität A (`uni-a.example`) möchte auf eine geschützte "Ressource B" zugreifen. Diese wird auf der Seite `pool.example/resource-b` angeboten. Der Discovery Service ist dabei unter `discovery.pool.example` und der Identity Provider der Home Organisation (hier Universität A) unter `idp.uni-a.example` erreichbar.

<!-- Universität A:      uni-a.example -->
<!-- IdP:                idp.uni-a.example           https://aai-demo-idp.switch.ch -->
<!-- Ressource:          pool.example/resource-b     https://aai-demo.switch.ch/secure/ -->
<!-- Discovery Service:  discovery.pool.example      https://wayf-test.switch.ch -->


## Prozessablauf im Detail {#sec:prozessablauf}

In diesem Abschnitt wird der vereinfachte Prozessablauf, welcher in @sec:szenario dargestellt wurde, vertiefend erklärt. Dabei soll das dort eingeführte Szenario verfolgt werden. Der Prozess erfolgt in drei übergeordneten Phasen:

1. Erster Zugriff auf den Service Provider und Identity Provider Discovery (siehe @fig:phase1-idp-discovery)
2. Session Initialisierung und Authentifizierungsanfrage (siehe @fig:phase2-session-auth)
3. Authentifizierung, Autorisierung und Ressourcenzugriff (siehe @fig:phase3-ressourcen-zugriff) [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019].

Die einzelnen Phasen werden im Folgenden genauer erläutert und als *Business Process Model and Notation* (BPMN) Diagrammen dargestellt. Die erste Phase ist dabei in grün, die zweite in orange und die dritte in lila markiert. Ein BPMN-Diagramm, welches alle drei Phasen enthält, kann [online](https://raw.githubusercontent.com/nicosrm/24-bis-shibboleth/refs/heads/main/assets/bis_bpmn.drawio.pdf)[^online-bpmn-ref] eingesehen werden.

[^online-bpmn-ref]: [https://raw.githubusercontent.com/nicosrm/24-bis-shibboleth/refs/heads/main/assets/bis_bpmn.drawio.pdf](https://raw.githubusercontent.com/nicosrm/24-bis-shibboleth/refs/heads/main/assets/bis_bpmn.drawio.pdf)


### Phase 1: Identity Provider Discovery

Im folgenden Abschnitt wird die erste Phase des Login-Prozesses mittels Shibboleth erläutert. Dabei handelt es sich um den ersten Zugriff einer Benutzerin oder eines Benutzers auf eine geschützte Ressource, d.h. auf den Service Provider. Dabei ist diese Person noch *nicht* beim jeweiligen Identity Provider angemeldet, sodass die *Identity Provider Discovery* stattfinden muss. Der Prozess ist als BPMN-Diagramm in @fig:phase1-idp-discovery dargestellt.

![BPMN-Diagramm zu Phase 1 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [@switchExpertDemoSWITCHaai2024a])](../assets/bis_bpmn_phase_1.drawio.svg){#fig:phase1-idp-discovery}

Zunächst greift die Benutzerin erstmalig auf die geschützte Ressource zu. Dabei wird folgende `GET`-Request gestellt:

```
GET https://www.pool.example/resource-b
```

Da die angefragte Ressource über das Shibboleth-System, insbesondere den Service Provider, geschützt ist, wird die Anfrage vom Service Provider geprüft. Dabei wird kontrolliert, ob bereits eine aktive Shibboleth-Session vorliegt, d.h. ob die Nutzerin bereits authentifiziert ist. Diese Information wäre im `_shibsession`-Cookie enthalten. Falls dieser aktuell und gültig ist, wird die Benutzerin schlussendlich an die Ressource weitergeleitet. Dieses Szenario wird in @sec:phase-3-ressourcenzugriff genauer erläutert [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019].

Falls jedoch noch keine aktive Shibboleth-Session vorliegt, wird die Benutzerin zum Discovery Service weitergeleitet. Da die Information, wohin die Benutzenden nach Auswahl der Home Organisation geschickt werden sollen, nicht verloren gehen darf, wird der `_shibstate`-Cookie gesetzt und Parameter mitgesendet. In neueren Shibboleth-Versionen wird dies mittels *Relay State*-Mechanismen gespeichert [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019].
<!-- TODO: ggf. Relay-State erklären -->

```
302 FOUND (REDIRECT)
  Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
    value=https://pool.example/resource-b
    path=/

  Location: https://discovery.pool.example/WAYF
  ?entityID=https://pool.example/shibboleth
  &return=https://pool.example/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem

GET https://discovery.pool.example/WAYF
  ?entityID=https://pool.example/shibboleth
  &return=https://pool.example/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem
```

Der Discovery Service ermittelt nun die Liste der verfügbaren bzw. unterstützten Identity Provider, welche im folgenden der Nutzerin präsentiert werden. Diese wählt ihren zutreffenden Identity Provider aus – in diesem Szenario entsprechend Universität A (`idp.uni-a.example`). Daher wird die Nutzerin im Anschluss an den ausgewählten Identity Provider der Home Organisation weitergeleitet [@switchExpertDemoSWITCHaai2024a].

```
POST https://discovery.pool.example/WAYF
  ?entityID=https://pool.example/shibboleth
  &return=https://pool.example/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem

POSTDATA
  user_idp=https://idp.uni-a.example/shibboleth

302 FOUND (REDIRECT)
Location: https://pool.example/shibboleth/Login
  ?SAMLDS=1
  &target=ss:mem
  &entityID=https://idp.uni-a.example/shibboleth
```


### Phase 2: Session Initialisierung und Authentifizierungsanfrage

In Phase 2 wird die Session initialisiert und eine Authentifizierungsanfrage gestellt. Der Prozess ist als BPMN-Diagramm in @fig:phase2-session-auth dargestellt.

![BPMN-Diagramm zu Phase 2 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [@switchExpertDemoSWITCHaai2024a])](../assets/bis_bpmn_phase_2.drawio.svg){#fig:phase2-session-auth}

Aufgrund des vorherigen Redirects zum Identity Provider der Home Organisation der Benutzerin, sendet der Browser nun eine `GET`-Request an den IdP. Der *Session Initiator* erstellt weiterhin eine Authentifizierungsanfrage (AuthN), welche automatisch mittels JavaScript abgesendet wird [@switchExpertDemoSWITCHaai2024a].

```
GET https://pool.example/shibboleth/Login
  ?SAMLDS=1
  &target=ss:mem
  &entityID=https://idp.uni-a.example/shibboleth

POST https://idp.uni-a.example/profile/SAML2/POST/SSO
  POSTDATA
    RelayState=ss:mem:23e3a3b1268acd89dc226bb1ce0d0c6ba7ecf773
    SAMLRequest=PHNhbWxwOkF1dGhuUmVxdWVzdCB4bWxuczp...
```

Der IdP prüft anschließend die Authentifizierungsanfrage. Wenn diese gültig ist, wird zunächst festgestellt, ob die Nutzerin bereits authentifiziert ist. Dies wird anhand des `_idp_session`-Cookies überprüft. Falls dem nicht so ist, wird eine geeignete Authentifizierungsmethode für die Benutzerin, basierend auf dem Protokoll des Service Providers, ausgewählt. Die Benutzerin wird anschließend an einen kompatiblen Login-Handler weitergeleitet [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019]. Dieses Szenario wird in @sec:phase-3-ressourcenzugriff genauer beschrieben.

In diesem Beispiel soll ein Nutzername und Passwort zur Authentifizierung verwendet werden. Bei diesem Redirect wird vom IdP  ein AuthN-Cookie gesetzt, welcher Informationen zur Ressource und einen Authentifizierungstoken enthält. Anschließend wird die Nutzerin zur tatsächlichen, spezifischen Anmeldeseite weitergeleitet [@switchExpertDemoSWITCHaai2024a].

```
302 MOVED TEMPORARILY (REDIRECT)
  Set-Cookie: _idp_authn_lc_key
    value=C22C16A197CB9606067A1A577EF5D996
    Path=/idp
    Secure

  Location: https://idp.uni-a.example:443/AuthnEngine

GET https://idp.uni-a.example/AuthnEngine
  Cookie: _idp_authn_lc_key
    value=C22C16A197CB9606067A1A577EF5D996

302 MOVED TEMPORARILY (REDIRECT)
  Location: https://idp.uni-a.example:443/Authn/UserPassword

GET https://idp.uni-a.example/Authn/UserPassword
  Cookie: _idp_authn_lc_key
    value=C22C16A197CB9606067A1A577EF5D996
```


### Phase 3: Ressourcenzugriff {#sec:phase-3-ressourcenzugriff}

In der letzten Phase kommt es schließlich zum Ressourcenzugriff. Der Ablauf wird im folgenden beschrieben und ist als BPMN-Diagramm in @fig:phase3-ressourcen-zugriff dargestellt.

![BPMN-Diagramm zu Phase 3 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [@switchExpertDemoSWITCHaai2024a])](../assets/bis_bpmn_phase_3.drawio.svg){#fig:phase3-ressourcen-zugriff}

Auf der Anmeldeseite des Identity Providers gibt die Benutzerin anschließend ihre Anmeldedaten ein. Diese werden mittels `POST`-Request an den IdP geschickt, welche den AuthN-Cookie enthält [@switchExpertDemoSWITCHaai2024a].

```
POST https://idp.uni-a.example/Authn/UserPassword
  POSTDATA
    j_username=demouser
    j_password=demo

  Cookie: _idp_authn_lc_key
    value=C22C16A197CB9606067A1A577EF5D996
```

Nach erfolgreicher Verifikation der Anmeldedaten durch den IdP, findet das *Attribute Resolving* und *Filtering* statt. Die erhaltenen Daten werden basierend auf den Protokollen und der Konfiguration des Service Providers durch einen Attribut-Filter auf die unbedingt notwendigen Daten reduziert, um ein Maß von Datenschutz zu gewährleisten. Anschließend wird eine HTML-Seite generiert, welche eine *SAML Assertion* beinhaltet. Letztere umfasst das Authentifizierungsstatement sowie das *Attribute-Statement*, welches die Nutzerattribute enthält. Die Daten werden in eine geeignete Form transformiert und ggf. verschlüsselt sowie signiert. Die Assertion wird daraufhin automatisch abgesendet. Zudem wird nun der `_idp_session`-Cookie gesetzt, der bei einer erneuten Authentifizierung durch denselben IdP ausgewertet wird. Direkt im Anschluss sendet der Browser eine `POST`-Request an den Service Provider, die sowohl die *SAML-Response* als auch den `_shibstate`-Cookie enthält [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019].

```
200 OK
Set-Cookie: _idp_session
  value=4m2ETlKYtvbNEmBzVNo3UHLuKSdo3HqTUqAmeZiar94=
  Path=/idp

[ASSERTION POST FORM HTML PAGE] 

POST https://uni-a.example/Shibboleth.sso/SAML2/POST
  POSTDATA
    RelayState=cookie
    SAMLResponse=PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGl...

  Cookie: _shibstate_64656661756c7468747470733a2f2...
    value=https://pool.example/resource-b
```

Anschließend verarbeitet der Service Provider die SAML-Assertion sowie die Authentifizierungs- und Attribut-Statements. Dabei werden die Attribute sowie andere Informationen aus der Nachricht extrahiert und eine neue User-Session erstellt. Schließlich wird die Nutzerin zur angefragten Ressource weitergeleitet, wobei ein Verweis auf die Ressource im `_shibstate`-Cookie bzw. Relay-State hinterlegt wird. Weiterhin wird der `_shibsession`-Cookie gesetzt, wodurch ein erneuter Zugriff auf den Service Provider (innerhalb einer bestimmten Zeit) direkt als authentifiziert gilt [@switchExpertDemoSWITCHaai2024a; @shibbolethFlowsAndConfigShibbolethConcepts2019].

```
302 FOUND (REDIRECT)
  Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
    value=
    path=/

  Set-Cookie: _shibsession_64656661756c7468747470733a2f2...
    value=_0b6d4e89d2e9c4481738094f2a2c9de0
    path=/

  Location: https://pool.example/resource-b
```

Schlussendlich findet eine erneute Anfrage an die geschützte Ressource (`pool.example/resource-b`) durch den Browser statt, welcher den `_shibsession`-Cookie enthält. [@switchExpertDemoSWITCHaai2024a, @shibbolethFlowsAndConfigShibbolethConcepts2019].

```
GET https://pool.example/resource-b
  Cookie: _shibsession_64656661756c7468747470733a2f2...
    value=_0b6d4e89d2e9c4481738094f2a2c9de0
```

Erneut wird der `_shibsession`-Cookie überprüft, wodurch diesmal eine aktive Shibboleth-Session erkannt wird. Somit kann die Autorisierung stattfinden, d.h. die Überprüfung, ob die Benutzerin über die notwendigen Rechte zum Zugriff auf die gewünschte Ressource verfügt. Die Rechte werden über alle anwendbaren *Access-Control*-Plugins, bspw. *Shibboleth Access Rules*, ermittelt, wobei unter anderem die Benutzer-Attribute abgeglichen werden. Da die Benutzerin in dem Fall über die notwendigen Rechte verfügt, wird der Zugriff schlussendlich auf die initial angefragte, geschützte Ressource gewährt [@switchExpertDemoSWITCHaai2024a].

```
200 OK
  [RESOURCE HTML PAGE]
```


## Einsatz von Shibboleth

*entfällt ggf., je nach Zeit*

- Einbindung von Shibboleth in existierendes System
- Voraussetzungen etc.
- Preisgestaltung ([Mitgliedschaften](#shibboleth-consortium-mitgliedschaften))


## Diskussion

Im Folgenden wird auf die Vorteile und Nachteile von Shibboleth eingegangen.

Shibboleth ist seit 2000 in Verwendung, weshalb es ein etabliertes Single Sign-On (SSO) System ist [@shibbolethShibbolethConsortium2024]. Grundsätzlich fallen als Open Source Software keine Kosten an. Das Shibboleth Consortium bietet allerdings kostenpflichtige Mitgliedschaften an, die das Projekt finanzieren und den Mitgliedern Hilfestellungen (Support) und weitere Partizipationsmöglichkeiten bieten [@shibbolethShibbolethConsortium2024], [@shibbolethMembership]. Dabei wird ein jährliche Betrag erhoben, der auf der Art und Größe der Institution basiert [@shibbolethConsortiumMembershipFees]. Größere Mitglieder sind u.a. der DNF Verein, die Stanford University, die University of Oxford oder das Massachusetts Institute of Technology [@shibbolethOurMembers2024]. Shibboleth unterstützt verschiedene Standardprotokolle wie beispielsweise SAML, OpenID Connect, LDAP [@cantorConsortiumFAQShibboleth2023], [@overtsoftwareAzureADADFS2022]. Zudem ist es Windows unabhängig und dezentral [@overtsoftwareAzureADADFS2022].

Shibboleth eignet sich nicht besonders für Unternehmen, welche hauptsächlich interne Zugriffsverwaltung und Authentifizierung benötigen, sondern unterstützt mehr den Austausch von Authentifizierungsdaten zwischen verschiedenen, teils externen Organisationen (föderierte Identitäten). Außerdem ist eine eigenverantwortliche Administration benötigt [@cantorConsortiumFAQShibboleth2023].

### Alternativen

Im weiterführenden Abschnitt werden Alternativen zu Shibboleth kurz beleuchtet.

Bei Active Directory (AD) handelt es sich um ein on-promise Identitätsmanagementsystem [@sommergutWasSindUnterschiede2019], welches sich besonders gut für Windows-Umgebungen eignet. Die Einrichtung und Verwaltung ist jedoch komplex und es wird kein Web-basiertes SSO angeboten.

Eine Alternative mit SSO ist Azure Active Directory bzw. Mircosoft Entra ID [@chikMicrosoftEntraExpands2023], [@celestedgNewNameAzure2024], welche im Vergleich zu AD Cloud-basiert ist und Mircosoft Abhängigkeiten besitzt [@sommergutWasSindUnterschiede2019]. Dadurch eignet sich Mircosoft Entra ID besonders für Unternehmen, die vollständig in Microsoft 365 und Azure integriert sind.

Darüber hinaus gibt es weitere kostenpflichtige Alternativen wie Okta, OneLogin oder Ping Identity, welche ebenfalls Cloud basierte Lösungen sind und den Fokus auf unterschiedliche Aspekte wie Sicherheit oder Benutzerfeundlichkeit legen [@oktaSecureSingleSignOn], [@oneloginErweiterteAuthentifizierung], [@pingidentityFunktionenPingIdentityPlattform].

### Zukunft

Shibboleth wird fortlaufend weiterentwickelt. In dem folgenden Abschnitt wird ein kurzer Einblick in die Agenda der nahen Zukunft gegeben.

Bis 2027 soll die passwortlose Authentifikation ermöglicht werden, sodass Nutzer:innen beispielsweise mit FIDO, WebAuthn und Passkeys vom Login-Handler authentifiziert werden. Zudem sollen Digital Wallets und verifizierte Anmeldedaten angegangen werden, wobei die Hauptrolle darin gesehen wird, ein Aussteller dieser zu werden oder sie zu verifizieren.

Verbessert werden soll die Produktdokumentation und Konfiguration des IdPs, um den Fokus mehr auf Konzepte, einleitendes Material und Beispiele zu legen.
Dies geht einher mit der Neukonzeption des SP, welcher zukünftig als Plugin für den IdP eingeführt werden soll.

Zudem soll die OpenID Federation unterstützt werden, was für mehr Harmonie zwischen den SAML und OpenID Metadaten sorgen soll.
Außerdem sollen weitere UI Komponenten zum IdP hinzugefügt werden, welche unter anderem Management von Login Aktivitäten und passwortloser Authentifikation behandeln [@shibbolethDevelopmentCenterProject2024].


## Zusammenfassung



## Literatur

::: {#refs}
:::


---

## Notizen

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
- TODO: weitere, anschauliche Motivation von [Switch AAI](https://help.switch.ch/aai/about/introduction/)

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

![Basic Interaction [vgl. @shibbolethShibbolethConcepts2023]](../assets/basic_interaction.drawio.svg){#fig:basic-interaction}

Grundlegende Interaktionen wie in @fig:basic-interaction dargestellt

1. SP erkennt Nutzer, der versucht, auf eingeschränkte Inhalte zuzugreifen
2. SP generiert Authentifizierungsanfrage, Senden der Anfrage und des Nutzers
   an IdP des Nutzers
3. IdP authentifiziert Nutzer, sendet Authentifizierungsantwort und Nutzer
   zurück an SP
4. SP: Verifikation der Antwort des IdP, Senden einer Anfrage an Ressource, die
   ursprünglich angefragten Inhalt zurückgibt

- TODO: weitere Inhalte auf verlinkter Seite

![Ablauf [@michelsIdentityManagementUnd]](../assets/ablauf.png)

![Ablauf-SSO [@michelsIdentityManagementUnd]](../assets/ablauf_SSO.png)

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

- Prozess der IdP Bestimmung: [*IdP Discovery*](#identity-provider-discovery-shibbolethidpdiscoveryshibbolethconcepts2020)
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

#### Metadaten

[@shibbolethMetadataConcepts]

- Bereitstellung der Configuationsdaten in der Kommunikaton zwischen SP und IdP
- Typischerweise in XML
- Basiert auf der SAML 2.0 Metadata specification standardized by OASIS
- Wah. zu spezifisch für eine allgemeine Erklärung von Shibboleth

#### Sessions

[@shibbolethSessionsConcepts]

- Der Prozess beinhaltet mehrere Sessions, zwischen user und service
- In den meisten Fällen durch cookies realisiert
- Zur Realisierung von Single Sign-On und damit einhergehender vermeidung weiterer Authentisierungen
- Jede Anwendung sollte eine eigene Session über den Browser haben
- Sessions sind eigenständig und der Ablauf ist unabhäning von den anderen
- Sonderfall: Single-log-out kann ein Problem sein, wenn Sessions miteinander verbunden werden

#### Name Identifiers

[@shibbolethShibbolethConceptsNameIdentifiers2020]

- In SAML2 dargestellt durch `<NameID>`-Element
    - nicht festgelegt was als *name identifier* verwendet wird
    - erschwert Interoperabilität
- Verwendet für spätere Kommunikation (Query, Logout Request)
- "transient" identifiers sind üblich in Shibboleth
- name identifier verbunden mit einem Format (für die Verarbeitung während der Laufzeit)
- Attributes können mehrere Werte besitzen -> nicht als identifiers nutzbar
- Shibboleth nutzt häufig Attributes mit *transient identifiers* (oder gar keinen)
  - meistens nicht bei kommerzieller Verwendung (verwendet name identifiers locker/unsachgemäß)


#### OpenSAML

[@shibbolethOpenSAML]

- "OpenSAML is a set of open source Java libraries used in support of the Shibboleth Project's implementation of the Security Assertion Markup Language (SAML). It is licensed under the Apache 2.0 license."
- OpenSAML ist keine vollumfängliche Implementierung von SAML IDP oder SP

#### Active-Directory vs Shibboleth

[@overtsoftwareAzureADADFS2022]

- Beides Identity Provider
- ADFS (Active Directory Federation Services) eher für größere Unternehmen
- Shibboleth vor allem im höheren Bildungskontext vertreten
- Shibboleth Windows-unabhänig und decentralized open-source software
- ADFS hat im vergleich zu Shibboleth weniger Schnittstellen implementiert wie LDAP oder SAML

##### Azure AD vs AD
[@sommergutWasSindUnterschiede2019]

- Azure Active Directory ist Identitätsmanagement der Microsoft-Cloud
- Active Directory ist das On-Promise Modell 

[@chikMicrosoftEntraExpands2023] [@celestedgNewNameAzure2024]

- Microsoft Azure Active Directory wurde zu Microsoft Entra ID umbenannt um verwirrung zu vermeiden

#### Weiteres

- TODO: [Glossar](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645488/Glossary)
    - hier auch hilfreiche Definition gegeben, falls noch fehlend
- ggf. [weitere Konzepte](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/overview#More-Concepts)

#### Identity Provider Discovery [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- Identifikation von Heim-IdP für Login bei Zugriff auf geschützte Ressource --> *IdP Discover*
- viele verschiedene Wege
- meistens Nutzenden direkt fragen, da diese:r am besten antworten kann
- Möglichkeiten
  - flache, statische Seite mit festen, bekannten möglichen IdPs (*Flat Page Discovery*)
  - dynamischer **Discovery Service**
    - separate Anwendung zur Generierung der verschiedenen Optionen basierend auf Metadaten
- Anzeige der Optionen und Weiterleitung zu entsprechendem Heim

<br>

##### Flat Page Discovery [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- meist ausreichend bei eingeschränkter, statischer Menge an IdPs
- Verwendung von *SessionInitiator* vom SP

###### von bekanntem Heim [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- Nutzende kommen direkt von Quelle, die Home-IdP per Definition kennt
- Quelle kann Nutzende direkt zur Ressource schicken
  - bereits authentifiziert für jeweiligen SP
  - oder bereits ausgewählten IdP für Nutzenden
- bspw. Campus-Portale, auf Bibliotheksseiten oder spezifische URL-Pfade für eine:n Kund:in

zwei Möglichkeiten für Redirect

- am besten Verwendung eines bekannten Session Initiators beim SP
  - kodierte Entity-ID für IdP an URL anhängen
  - Beispiel auf [Website](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263)
  - Untersuchung der Metadaten durch SP --> Validierung (bekannt?) und Weiterleitung zu richtigen Endpoints bei IdP und SP
  - automatisches und direktes Absenden der AuthnRequest zu IdP
  - Nutzende landen nach Authentifizierung direkt bei Ressource
  - kann in jegliche Links platziert werden
  - optionale Angabe eines separaten `target`s zur Spezifizierung der Landing Page
- in Anwendung / Application
  - bei sehr kleiner, bekannter Menge an IdPs
  - bspw. über Einbettung der verschiedenen Logos für jeden Provider mit Links zu jeweiligem Session Initiator
  - ähnlich zu anderer Möglichkeit, aber Verwendung eines speziellen Session Initiators für jeden IdP
  - verpflichtende Spezifizierung eines `target`s
  - Beispiel auf [Website](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263)

##### Discovery Service [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- *IdP Discovery Service* (DS)
- Service zur Präsentation eines Standard-Interfaces zur Auswahl des IdPs
- hoch-anpassbare Darstellungsmöglichkeiten
- nach Auswahl durch Nutzenden: Weiterleitung zu SP des Nutzenden
- SP sendet AuthnRequest basierend auf Auswahl
- meist direkte Weiterleitung zu DS
  - moderne Implementierungen erlauben Einbettung des Discovery-Interfaces in Seite
    - [Embedded DS](#embedded-discovery-service)
- Betreibung mit Ressource oder als zentraler, geteilter Service

**Betreibung mit Ressource**

- Präsentation der kleinstmöglichen Anzahl an Auswahlmöglichkeiten
- Ressource kennt alle IdPs, die es akzeptiert und kennt mit welchen *Federation*s es kooperiert
- v.a. bei Services mit mehreren Communities oder Teilmengen davon hilfreich
- ggf. schlaues Vorschlagen von wahrscheinlicheren IdPs basierend auf Metadaten (bspw. IP-Adresse)
- ggf. Branding der Ressource entsprechend DS
- Nachteil: jede Ressource muss eigenen DS verwalten, ggf. Inkonsistenzen in UX
- [weitere Infos zum Einreichten](https://shibboleth.atlassian.net/wiki/spaces/SHIB2/pages/2577072297/DiscoveryService)

**zentraler Ansatz**

- Umfragen: Konsistenz als wichtigstes Feature
- Garantieren durch zentralen DS
- erlaubt Persistenz über mehrere Anwendungen, die sich DS teilen
  - Nutzende müssen erheblich weniger ihr Home-IdP auswählen
- meist im Verbund betrieben \[bspw. DFN\]
  - ggf. Probleme für Anwendungen, die mehrere Verbünde unterstützen
  - ähnliche UX wie DS, welche mit Ressource betrieben werden, mittels [SeamlessAccess](https://seamlessaccess.org/)

#### IdP Installation [@shibbolethInstallationIdentityProvider2024]

- Prüfung der [System Requirements](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199511079)
- Requirements
  - TLS Key / Certificate für HTTP(S)
  - gewünschte Entity-ID-URL für IdP
  - 2nd/3d-level-DNS-Subdomain für *Scoped Attributes* (meist E-Mail-Domain der Organisation)
  - Quellen der SAML Metadaten für SPs, welche von IdP unterstützt werden sollen
- Prozess erstellt
  - überschreibbaren IdP's Entity-ID
  - separates, selbst-signiertes Key/Certificate-Paar für
    - Message Signing und
    - Verschlüsselung der Daten anderer Systeme zum Entschlüsseln durch IdP
  - Secret Key and Key Version File zum Sichern der cookies und anderer produzierter Daten
  - initiale Beispiel-Metadaten zur Beschreibung des IdPs
    - Verwendung durch kooperierende SPs
  - Standard-IdP-Konfigurationsdateien basierend auf o.g. Informationen
- Installation auf Windows separat (hier nur nicht-Windows)

<br>

- IdP ist Standard-Java-Web-Anwendung basierend auf Jakarta Servlet 5.0 Spezifikation
- sollte in kompatiblen Servlet-Container (Jetty (empfohlen) oder Tomcat) laufen
- Schritte
  - Vorbereitung eines Servlet Containers (Empfehlung: Jetty)
  - Herunterladen und Entpacken des IdP Softwarepakets
  - `bin/install.sh` ausführen
    - ggf. Property File für [*Property Driven Installation*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199500711/PropertyDrivenInstallation) angeben
    - verschiedene CLI-Argumente
  - Deployment der IdP-WAR-Datei `war/idp.war` (siehe Servlet Container Preparation Notes)
- Testen mittels `bin/status.sh`

<br>

typische nächste Schritte

- [Konfigurationsseite](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199501666/Configuration) anschauen
- Konfiguration der [Authentifizierung](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199505085)
  - TODO: ggf. näher anschauen
- Konfiguration der [*Attribute Resolution*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199502864/AttributeResolverConfiguration)
- [Hello World](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199510241) ausprobieren zum test der Konfigurationen
- Laden der SAML-Metadaten für SPs
- Herstellen einer [*Attribute Release Policy*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199501794)
- Anpassung der [Login UI](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199505587), Fehlerbehandlung etc.

#### Service Provider V3

[@shibbolethServiceProviderApplication2021]

- Service Provider (SP) - System welches Authentifizierung von IdP entgegen nimmt
- Keine Relation zwischen installierten(/physichen) SP und *logical* SP
  - ein SP kann mehrere Web Servers beinhalten
  - mit einer Installation können mehrere verschiedene SP bereitgestellt werden
- *entityID* bezeichnet SP - normalerweise eine URL
- Ein SP ist zuständig für einen *logical service* - IdP kann Ressourcen nur an unterschiedlichen SP unterscheiden


##### Applications

- SP kümmert sich um die Gruppierung von Ressourcen
- Eine Gruppierung ist eine *Application* 
  - eine *user session* ist mit einer Application verbunden
  - zugriff auf andere Application -> unabhängige Verständigung mit IdP, andere *assertions*, unabhängige Attribute gecached
    - könnte zu einem seperaten Login führen 
  - normalerweise verbunden mit einem *logical* SP -> flexibler mit SP V3
  - verwendet eine *handlerURL* 
    - Prefix von Anfragen an SP *handlers* bspw. *Assertion Consumer Services* und *Session Initiators*
- Keine technische Notwendigkeit zwei Ressourcen einer Application im selben Ordner oder sogar selben virtuel host zu haben

##### Content Protection

[@shibbolethServiceProviderProtectContent2021]

###### Active

- Abfangen von Anfragen an die Ressource um die Session auf eine valide Authentifizierung zu überprüfen
- Anhängen von `requireSession` an die Ressource
- Statische Zugangsbeschränkungen mit den Session-Informationen möglich

###### Passive

- Nutzen von *CGI* Variablen um Informationen über authetifizierte Sessions bereitzustellen
- Unauthentifizierte Anfragen werden unverändert gelassen
- Sinnvoll bei "Gast"-Nutzung und bei Verwendung verschiedener Authentifizierungmethoden

#### Embedded Discovery Service

[@shibbolethEmbeddedDiscoveryService2021]

- Eigener discovery service beim SP durch Embedded Discovery Service (EDS) möglich
- Kein redirect zu einer third-party discovery service Seite

[@shibbolethEmbeddedDiscoveryService2011]

- Wird verwendet während des Single Sign-On (SSO)
- Nutzer wählt IdP aus -> startet SSO
- Lösungen neben EDS
  - URI manuell eingeben
  - manche IdPs "hard-coden"
  - zentralisierte discovery, hat Probleme:
    - kann IdPs vorschlagen, die nicht mit dem SP zusammenhängen
    - anderes Aussehen und Handhabung
    - keine Möglichkeit IdPs bevorzugt darstellen
- EDS bietet
  - nahtloser Übergang von SP -> EDS -> IdP
  - Einschränkung der angezeigten IdPs
  - Ordnung der IdPs konfigurieren

### Shibboleth Consortium Mitgliedschaften

[@shibbolethShibbolethConsortium2024]

- Finanzierung durch Mitgliedschaften
- erlaubt Unterstützung und Pflege des Systems
- verringertes Risiko für Organisationen, die Shibboleth verwenden
- u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology [@shibbolethOurMembers2024] (Auswahl)

<br>

[@shibbolethMembership]

- Mitgliedschaft bringt exclusiven Support wie Slack-Channel
- Unterstüzt die Weiterentwicklung
- Partizipation durch Einbringen von eigenen Ideen und Vorschlägen für die Weiterentwicklung

[@shibbolethConsortiumMembershipFees]

- Als Consortium Mitglied bezahlt man basierend auf der Art und Größe der Institution einen jährlichen Geldbetrag (Fee)

### Einsatz

#### DFN

[@dfnDFNAAIDokumentationEinfuhrung]

- DFN-AAI = Deutsches Forschungsnetz Authentication and Authorization Infrastructure
- IdPs sind die Heimatorganisationen (Bildungs- und Forschungseinrichtungen)
- SP sind der teilnehmenden Dienstanbieter (Content-Provider, E-Learning-Plattformen, wissenschaftliche Dienste, etc.)
- IdPs und SPs sind beim im DFN-AAI registriert
- Attribute Authorities sind zusätzliche Instanzen
  - projektspezifische Nutzerdaten hinterlegt, die nicht beim IdP gespeichert sind
- Nutzung von SAML zur Kommunikation der Entities (IdP, SP, Attribute Authorities) untereinander
- IdPs verpflichten sich die Metadaten aktuell zu halten damit SPs sich auf Berechtigung verlassen können

#### Switch AAI

[@switchIntroductionSWITCHaai2024]

- AAI: *Authentication and Authorisation Infrastructure*
- Ziel: Vereinfachung von inter-organisationellem Zugriff auf Web-Ressourcen
- von den meisten Universitäten in der Schweiz eingesetzt
- Konzept: *Federated Identity Management*
- Vorteile
  - einfache Anmeldung ohne Registrierung bei verschiedenen Services
  - standardisierte Interfaces $\to$ einfache Integration weiterer Organisationen
  - standardisierte Authentifikationsmechanismen $\to$ nur ein Passwort für viele Anwendungen

![SWITCHaai: At a Glance [@switchIntroductionSWITCHaai2024]](https://help.switch.ch/aai/about/aai-at-a-glance.png)

[@switchSWITCHaai2024]

- ohne AAI: Registrierung bei jeder Ressource
  - jeweils Nutzername und Passwort
  - Administrator: Verwaltung und Implementierung
- mit AAI: vereinfacht
  - eine Registrierung bei Home-Organisation genügt, bspw. Institutionen wie Universitäten, Bibliotheken etc.
  - Authentifikation über Home-Organisation
    - kann weitere Informationen bereitstellen
    - Credentials nur einmal notwendig
    - keine neue Registrierung und Verwaltung von Nutzenden notwendig
  - Ressourcen-Administratoren definieren Access Rules basierend auf erhaltenen Nutzerinformationen
- *SWITCH*
  - verwaltet zentrale AAI-Komponenten
  - unterstützt Home-Organisations und Ressourcen

##### Einfache Demo [@switchSimpleDemoSwitchAAI2024]

- zunächst nur Nutzersicht

![Shibboleth Login Procedure [@switchSimpleDemoSwitchAAI2024]](https://help.switch.ch/aai/demo/resources/simple_complete.png)

- Zugriff von Nutzer von "Uni B" auf geschützte Ressource "Medical Training 1",
  gehostet auf `www.resource.ex`
- Schritt 1: Verbindung Nutzer - Ressource und Weiterleitung
  - Zugriff auf geschützte Ressource auf `www.resource.ex`
  - aktive Shibboleth-Session $\to$ direkte Weiterleitung zur Ressource
  - sonst Authentifizierung bei *Home Organisation* (Uni B)
  - Ressource hat keine Information über Home Org. des Nutzers $\to$ Weiterleitung
    zum *Discovery Service* (*Where Are You From service*, WAYF) (`www.wayf.ex`)
- Schritt 2: Wahl der Home Org.
  - Discovery Service $\to$ Liste von Home Organisationen
  - Auswahl durch Nutzenden (hier Uni B) 
  - Weiterleitung zur Ressource inkl. Authentifizierungsanfrage über Browser
  - somit Weiterleitung zur Login-Seite der Home Org. `www.uni-b.ex`
  - ggf. Überspringen der Auswahl der Home Org. wenn noch gespeichert
- Schritt 3: Authentifizierung des Nutzenden bei Home Org.
  - Login-Seite von Uni B
  - normale Zugangsdaten von Home Org. (meist Nutzername und Passwort)
  - korrekte Eingabe $\to$ Weiterleitung zu ursprünglich angeforderter Ressource
    auf `www.resource.ex`
- Schritt 4: Zugriff auf Ressource gewährt
  - nach erfolgreicher Authentifizierung bei Home Org.
  - Ressource entscheidet, ob Zugriff gewährt wird (*Autorisierung*)
  - basierend auf von Home Org. übermittelte Nutzerinformationen
  - Home Org. gibt nur zwingen notwendige Informationen Preis $\to$ Garantie des 
    Datenschutzes
- kein zusätzlicher Account notwendig sondern Authentifizierung mittels Home Org.
- keine Preisgabe des Nutzernamens
- Ende der Session
  - nach Authentifizierung mittels Shibboleth: Zugriff auf alle 
    Shibboleth-geschützten Ressourcen ohne erneute Authentifizierung
  - erst nach Schließen des Browsers oder bestimmter Zeit erneut notwendig

##### Medium Demo [@switchMediumDemoSwitchAAI2024]

- selbiges Szenario wie in Einfache Demo
- Live Demo (ggf. für **Präsentation**?)
  - Ressource: `https://aai-demo.switch.ch/secure/`
  - Discovery Service: `https://wayf-test.switch.ch`
  - Home Org. Login: `https://aai-demo-idp.switch.ch`
- Schutz via SSL

![Vollständiger Login-Prozess vom Shibboleth [@switchMediumDemoSwitchAAI2024] (Schritt-für-Schritt-Bilder vorhanden)](https://help.switch.ch/aai/demo/resources/medium_complete.png)

Phase 1: Verbindung Nutzer - Ressource und Weiterleitung

- direkte Weiterleitung bei aktiver Shibboleth-Session
- *oder* Weiterleitung zu Discovery Service (WAYF)
- Schritt 1
  - HTTP-Request an `aai-demo.switch.ch` für Webseite `/secure/`
  - Antwort vom Web-Server: HTTP-Redirect an Discovery Service `wayf-test.swtch.ch`, 
    da keine valide Shibboleth-Session vorhanden (noch keine Authentifizierung)
- Schritt 2: Discovery Service sendet HTML Webseite mit Liste aller verfügbaren Home Org.

Phase 2: Authentifizierungsanfrage

- Live Demo: Auswahl von "AI Demo Home Organisation"
- Schritt 3
  - Absenden des Formulars zur Wahl der Home Org.
  - Antwort vom Discovery Service: Weiterleitung zum *Session Initiator* der Ressource
- Schritt 4
  - Erstellung einer Authentifizierungsanfrage für gewählte Home Org. durch
    Session Initiator
  - Abschicken durch Nutzer-Browser zur Home Org.
- Schritt 5
  - Verwertung der Anfrage durch Home Org.
  - Antwort: Login-Seite

Phase 3: Authentifizierung des Nutzenden bei Home Org.

- Live Demo: uname `demouser` / pw `demo`
- je nach Home Org. unterschiedlich
- Credentials: Nutzername & Passwort, Biometrie, Chip-Karte etc.
- Schritt 6
  - Nutzende stellen Credentials zur Verfügung
  - Prüfung der Credentials
  - Erstellung einer *Assertion* mit Nutzerattributen (verschlüsselt) entsprechend
    den Attributfilter
- Schritt 7
  - Abschicken der Assertion via Browser zurück zur Ressource
  - Autorisierung basierend auf Attributen durch Ressource
  - erfolgreich: Weiterleitung zu geschützter Ressource

##### Experten Demo [@switchExpertDemoSWITCHaai2024a]

- inkl. Hintergrundprozesse und interagierende Komponenten
- hier dekodiertes URL-Format

![Gesamter Login-Prozess [@switchExpertDemoSWITCHaai2024a] (Schritt-für-Schritt-Bilder vorhanden)](https://help.switch.ch/aai/demo/resources/expert_complete.png)


Phase 1: erster Zugriff auf Service Provider und IdP Discovery

- Schritt 1: User $\Leftrightarrow$ Browser $\Leftrightarrow$ Service Provider
  - Zugriff auf Service Provider unter `https://aai-demo.switch.ch/secure`
    ```
    GET https://aai-demo.switch.ch/secure
    ```
  - vom Shibboleth SP geschützt $\to$ Überprüfung, ob bereits Shibboleth-Session 
    aktiv (d.h. bereits authentifiziert)
  - nicht auth. $\to$ HTTP Redirect zum Discovery Service `wayf-test.switch.ch`
  - braucht Informationen, wohin Nutzender schließlich geschickt werden muss
    $\to$ Bereitstellung als `GET`-Parameter
    ```
    302 FOUND (REDIRECT)
      Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=https://aai-demo.switch.ch/secure
        path=/

      Location: https://wayf-test.switch.ch/SWITCHaai/WAYF
      ?entityID=https://aai-demo.switch.ch/shibboleth
      &return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem
    ```
- Schritt 2: Browser $\Leftrightarrow$ Discovery Service
  - Abschicken einer neuen Anfrage an Discovery Service
    ```
    GET https://wayf-test.switch.ch/SWITCHaai/WAYF
      ?entityID=https://aai-demo.switch.ch/shibboleth
      &return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem
    ```
  - Antwort mit Website zur Auswahl des IdP
    ```
    200 OK
      [WAYF DROPDOWN HTML PAGE] 
    ```
- Schritt 3: Nutzer $\Leftrightarrow$ Browser $\Leftrightarrow$ Discovery Service
  - Discovery Service Seite: Nutzer schickt IdP-Auswahl ab
    ```
    POST https://wayf-test.switch.ch/aaitest/WAYF?entityID=https://aai-demo.switch.ch/shibboleth&return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem

    POSTDATA
      user_idp=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```
  - Discovery Service sendet Redirect zur *Return-Destination* inkl. ausgewähltem IdP
    ```
    302 FOUND (REDIRECT)
    Location: https://aai-demo.switch.ch/Shibboleth.sso/Login
      ?SAMLDS=1
      &target=ss:mem
      &entityID=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```

Phase 2: Session Initialisierung und Authentifizierungsanfrage

- Schritt 4: Browser $\Leftrightarrow$ Service Provider
  - Browser sendet folgende Request aufgrund von vorheriger Redirect-Response
    ```
    GET https://aai-demo.switch.ch/Shibboleth.sso/Login
      ?SAMLDS=1
      &target=ss:mem
      &entityID=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```
  - Session Initiator erstellt Authentifizierungsanfrage
  - Absenden innerhalb einer *Auto-Submit-Post-Form*
    ```
    200 OK
      [AUTHN REQUEST POST FORM HTML PAGE]
    ```
- Schritt 5: Browser $\Leftrightarrow$ IdP
  - Browser postet Request automatisch mittels JS
    ```
    POST https://aai-demo-idp.switch.ch/idp/profile/SAML2/POST/SSO
    POSTDATA
      RelayState=ss:mem:23e3a3b1268acd89dc226bb1ce0d0c6ba7ecf773
      SAMLRequest=PHNhbWxwOkF1dGhuUmVxdWVzdCB4bWxuczp...
    ```
  - Prüfen der Authentifizierungsanfrage vom IdP (Nutzer noch nicht auth.)
  - Senden eines Redirects zum entsprechenden Login-Handler
    - hier: Nutzername, Passwort
    ```
    302 MOVED TEMPORARILY (REDIRECT)
      Set-Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
        Path=/idp
        Secure

      Location: https://aai-demo-idp.switch.ch:443/idp/AuthnEngine
    ```
- Schritt 6: Browser $\Leftrightarrow$ IdP
  - Weiterleitung des Webbrowsers zum Nutzername / Passwort Login-Handlers
    ```
    GET https://aai-demo-idp.switch.ch/idp/AuthnEngine
      Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
    ```
  - Weiterleitung zu spezifischer Anmeldeseite durch IdP
    ```
    302 MOVED TEMPORARILY (REDIRECT)
      Location: https://aai-demo-idp.switch.ch:443/idp/Authn/UserPassword
    ```
- Schritt 7: Browser $\Leftrightarrow$ IdP
  - Senden einer `GET`-Request für Login-Seite durch Browser
    ```
    GET https://aai-demo-idp.switch.ch/idp/Authn/UserPassword    
      Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
    ```
  - Antwort vom Webserver mit Nutzername/Passwort-Seite
    ```
    200 OK
      [USERNAME PASSWORD LOGIN FORM HTML PAGE]
    ```

Phase 3: Authentifizierung, Attribut-Statement und Zugriff

- Schritt 8: Nutzer $\Leftrightarrow$ Browser $\Leftrightarrow$ IdP
  - Eingabe der Credentials durch Nutzenden
  - Abschicken an IdP
  ```
  POST https://aai-demo-idp.switch.ch/idp/Authn/UserPassword
    POSTDATA
      j_username=demouser
      j_password=demo

    Cookie: _idp_authn_lc_key
      value=C22C16A197CB9606067A1A577EF5D996
  ```
  - Verifikation der Credentials durch Authentifizierungs-Engine des IdPs
  - erfolgreich $\to$ Attribute-Resolving und -Filtering durch *Attribute Authority*
  - Generierung einer HTML-Seite inkl. *SAML Assertion*
    - beinhaltet Auth.-Statement und Attribute Statement mit Nutzerattributen
    - daher "Attribut Push"
  - Übertragung der Assertion mittels *Auto-Submit-Post-Form*
  ```
  200 OK
  Set-Cookie: _idp_session
    value=4m2ETlKYtvbNEmBzVNo3UHLuKSdo3HqTUqAmeZiar94=
    Path=/idp
    
  [ASSERTION POST FORM HTML PAGE] 
  ```
- Schritt 9: Browser $\Leftrightarrow$ Service Provider
  - direkt im Anschluss: Absenden der folgenden Anfrage durch Browser
    ```
    POST https://aai-demo.switch.ch/Shibboleth.sso/SAML2/POST
      POSTDATA
        RelayState=cookie
        SAMLResponse=PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGl...

      Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=https%3A%2F%2Faai-demo.switch.ch%2Fsecure
    ```
  - Verarbeitung der SAML Assertion inkl. Authentifizierungs- und 
    Attribut-Statements durch SP
  - SP: Absenden eines Redirects zur angefragten Ressource
    - Lagerung der URL in `_shibstate` Cookie
    ```
    302 FOUND (REDIRECT)
      Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=
        path=/

      Set-Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0
        path=/

      Location: https://aai-demo.switch.ch/secure
    ```
- Schritt 10: Browser $\Leftrightarrow$ Service Provider
  - vgl. Schritt 1: erneute Anfrage der geschützten Ressource
    (`https://aai-demo.switch.ch/secure`)
    ```
    GET https://aai-demo.switch.ch/secure
      Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0
    ```
  - Nutzer bereits authentifiziert
  - Entscheidung über notwendige Rechte durch Apache Web-Server
    - eingebettetes `mod_shib`-Modul: Untersuchung der Shibboleth-Access-Rules
    - Matching mit Nutzer-Attributen
    - Access-Rule in Demo:
      ```
      # content of secure/.htaccess
      AuthType shibboleth
      ShibRequireSession On
      require valid-user 
      ```
  - SP gibt Inhalt der Seite zurück
    ```
    200 OK
      [RESOURCE HTML PAGE]
    ````
- folgende Zugriffe an SP werden direkt gewährt (Timeout)

### TODO: Alternativen zu Shibboleth

- https://www.techrepublic.com/article/best-open-source-iam-tools/
- https://alternativeto.net/software/shibboleth/
- https://gist.github.com/bmaupin/6878fae9abcb63ef43f8ac9b9de8fafd
- https://goauthentik.io/
