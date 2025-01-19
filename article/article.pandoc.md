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

*Shibboleth* ist ein Open-Source-Softwareprojekt für Web-basiertes SSO und Identitätsmanagement für föderierte Systeme, wie beispielsweise akademische Institute, Identitätsverbände oder kommerzielle Organisationen. Verschiedene Komponenten verwalten die Authentifizierung sowie den Zugriff auf geschützte Ressourcen [@shibbolethShibbolethConsortium2024; @cantorConsortiumFAQShibboleth2023; @shibbolethOurMembers2024].

Vor allem an akademischen Institutionen, wie der Hochschule für Technik, Wirtschaft und Kultur Leipzig (HTWK), wird Shibboleth eingesetzt. Bei der HTWK ermöglicht Shibboleth im Verbund des *Deutschen Forschungsnetzes* (DFN) beispielsweise ein sicheres Identitätsmanagement und sowie ein Login mit nur einem Benutzernamen und Passwort bei verschiedenen Web-Diensten [@switchIntroductionSWITCHaai2024; @hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen; @shibbolethOurMembers2024].

So ist es an der HTWK möglich, sich unter anderem bei den E-Learning Plattformen [*OPAL*](https://www.bps-system.de/opal-lernplattform/) sowie [*AutoTool*](https://git.imn.htwk-leipzig.de/waldmann/autotool/), der HTWK-Webseite, den verschiedenen GitLab-Instanzen, der Hochschulbibliothek oder verschiedenen wissenschaftliche Ressourcen wie *IEEE Xplore* und *SpringerLink* mit denselben Logindaten anzumelden [@switchIntroductionSWITCHaai2024; @hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen]. Die Authentifizierung wird über einen zentralen *Identity Provider* durchgeführt und vereinfacht die Nutzung der Services durch Studierende und Mitarbeitende. Ebenso ist eine einfachere und sicherere Administration des Identitätsmanagements ermöglicht [@switchIntroductionSWITCHaai2024].

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


## Diskussion

Im folgenden Abschnitt wird Shibboleth diskutiert. Dabei wird auf die Vorteile und Nachteile eingegangen und verschiedene Alternativen beleuchtet. Abschließend wird ein kurzer Einblick in die Agenda der nahen Zukunft gegeben.

Shibboleth ist seit 2000 in Verwendung und hat sich seitdem zu einem etablierten SSO-System entwickelt [@shibbolethShibbolethConsortium2024]. Grundsätzlich fallen als Open Source Software keine Kosten an. Das *Shibboleth Consortium* bietet allerdings kostenpflichtige Mitgliedschaften an, die das Projekt finanzieren und den Mitgliedern Hilfestellungen (*Support*) sowie weitere Partizipationsmöglichkeiten bieten [@shibbolethShibbolethConsortium2024; @shibbolethMembership]. Dabei wird ein jährlicher Beitrag erhoben, der auf der Art und Größe der Institution basiert [@shibbolethConsortiumMembershipFees]. Größere Mitglieder sind unter anderem der Verein zur Förderung eines Deutschen Forschungsnetzes (DFN-Verein), die Stanford University, die University of Oxford oder das Massachusetts Institute of Technology (MIT) [@shibbolethOurMembers2024]. Shibboleth unterstützt verschiedene Standardprotokolle wie beispielsweise SAML, OpenID Connect und LDAP [@cantorConsortiumFAQShibboleth2023; @overtsoftwareAzureADADFS2022]. Außerdem ist es Windows-unabhängig und dezentral [@overtsoftwareAzureADADFS2022].

Shibboleth ist nicht für Unternehmen gedacht, welche hauptsächlich interne Zugriffsverwaltung und Authentifizierung benötigen. Vielmehr unterstützt es den Austausch von Authentifizierungsdaten zwischen verschiedenen, teils externen Organisationen (föderierte Identitäten). Weiterhin ist eine eigenverantwortliche Administration notwendig [@cantorConsortiumFAQShibboleth2023].

### Alternativen

Eine Alternative zu Shibboleth ist *Active Directory* (AD), bei der es sich um ein On-Premise Identitätsmanagementsystem handelt[@sommergutWasSindUnterschiede2019], welches sich besonders gut für Windows-Umgebungen eignet. Die Einrichtung und Verwaltung ist jedoch komplex und es wird kein Web-basiertes SSO angeboten.

Ein alternatives Identitätsmanagementsystem mit SSO ist *Azure Active Directory* (AAD) bzw. *Microsoft Entra ID* [@chikMicrosoftEntraExpands2023; @celestedgNewNameAzure2024], welches im Vergleich zu AD Cloud-basiert ist und Microsoft Abhängigkeiten besitzt [@sommergutWasSindUnterschiede2019]. Dadurch eignet sich Microsoft Entra ID besonders für Unternehmen, die vollständig in Microsoft 365 und Azure integriert sind.

Darüber hinaus gibt es weitere kostenpflichtige Alternativen wie *Okta*, *OneLogin* oder *Ping Identity*, welche ebenfalls Cloud-basierte Lösungen sind und den Fokus auf unterschiedliche Aspekte wie Sicherheit oder Benutzerfreundlichkeit legen [@oktaSecureSingleSignOn; @oneloginErweiterteAuthentifizierung; @pingidentityFunktionenPingIdentityPlattform].

### Zukunft

Die Agenda von Shibboleth sieht vor, bis 2027 die passwortlose Authentifikation zu ermöglichen, sodass Nutzer:innen beispielsweise mit FIDO, WebAuthn und Passkeys vom Login-Handler authentifiziert werden können. Zudem sollen *Digital Wallets* und verifizierte Anmeldedaten angegangen werden, wobei die Hauptrolle darin gesehen wird, ein Aussteller dieser zu werden oder sie zu verifizieren [@shibbolethDevelopmentCenterProject2024].

Verbessert werden soll die Produktdokumentation und Konfiguration der IdPs, um einen Fokus auf Konzepte, einleitendes Material und Beispiele zu legen. Dies geht einher mit der Neukonzeption der SPs, welche zukünftig als Plugin für IdPs eingeführt werden sollen [@shibbolethDevelopmentCenterProject2024].

Darüber hinaus soll die *OpenID Federation* unterstützt werden, um die Harmonie zwischen den SAML und OpenID Metadaten zu verstärken. Außerdem sollen weitere UI-Komponenten zum IdP hinzugefügt werden, welche sich unter anderem mit dem Management von Login-Aktivitäten sowie einer passwortlosen Authentifikation befassen [@shibbolethDevelopmentCenterProject2024].


## Zusammenfassung

Shibboleth ist ein sich weiterentwickelndes Web-basiertes SSO und Identitätsmanagementsystem, bestehend aus drei Komponenten: Identity Provider (IdP), Service Provider (SP) und Discovery Service (DS).

Zuständig für die Verwaltung der geschützten Ressourcen ist der SP, welcher bei einer Zugriffsanfrage nach einer aktiven Session und Autorisierung prüft. Besteht keine aktive Session, stellt der DS zur Ermittlung des zuständigen IdPs der oder dem Benutzer:in eine Auswahl von Home-Organisations. Der ausgewählte IdP authentifiziert anschließend die oder den Benutzer:in und schickt erneut eine Zugriffsanfrage an den SP.

Dieses Verfahren ermöglicht den Austausch von Authentifizierungsdaten auch zwischen verschiedenen externen Organisationen und wird dadurch vor allem von föderierten Institutionen eingesetzt. Als Open Source Software fallen keine Kosten an, es gibt aber die Möglichkeit einer kostenpflichtigen Mitgliedschaft, welche unter anderem Support für die ansonsten eigenverantwortliche Administration anbietet.


## Literatur

::: {#refs}
:::
