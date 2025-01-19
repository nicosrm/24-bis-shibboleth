# 1 Shibboleth

## 1.1 Einführung

Heutzutage ist der Zugriff auf eine Vielzahl von Online-Diensten und
-Ressourcen erforderlich. Vor allem in föderierten Systemen sind
*Single-Sign-On*-Systeme (SSO) weit verbreitet. Diese ermöglichen es,
dass Benutzer:innen nach einmaliger Authentifizierung Zugriff auf
verschiedene Anwendungen und Dienste haben, d.h. ohne sich mehrfach
anmelden zu müssen [\[1\]](#ref-switchIntroductionSWITCHaai2024).

*Shibboleth* ist ein Open-Source-Softwareprojekt für Web-basiertes SSO
und Identitätsmanagement für föderierte Systeme, wie beispielsweise
akademische Institute, Identitätsverbände oder kommerzielle
Organisationen. Verschiedene Komponenten verwalten die Authentifizierung
sowie den Zugriff auf geschützte Ressourcen
[\[2\]](#ref-shibbolethShibbolethConsortium2024),
[\[3\]](#ref-cantorConsortiumFAQShibboleth2023),
[\[4\]](#ref-shibbolethOurMembers2024).

Vor allem an akademischen Institutionen, wie der Hochschule für Technik,
Wirtschaft und Kultur Leipzig (HTWK), wird Shibboleth eingesetzt. Bei
der HTWK ermöglicht Shibboleth im Verbund des *Deutschen
Forschungsnetzes* (DFN) beispielsweise ein sicheres Identitätsmanagement
sowie ein Login mit nur einem Benutzernamen und Passwort bei
verschiedenen Web-Diensten
[\[1\]](#ref-switchIntroductionSWITCHaai2024),
[\[4\]](#ref-shibbolethOurMembers2024),
[\[5\]](#ref-hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen).

So ist es an der HTWK möglich, sich unter anderem bei den E-Learning
Plattformen [*OPAL*](https://www.bps-system.de/opal-lernplattform/) und
[*AutoTool*](https://git.imn.htwk-leipzig.de/waldmann/autotool/), der
HTWK-Webseite, den verschiedenen GitLab-Instanzen, der
Hochschulbibliothek oder verschiedenen wissenschaftliche Ressourcen wie
*IEEE Xplore* und *SpringerLink* mit denselben Logindaten anzumelden
[\[1\]](#ref-switchIntroductionSWITCHaai2024),
[\[5\]](#ref-hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen).
Die Authentifizierung wird über einen zentralen *Identity Provider*
durchgeführt und vereinfacht die Nutzung der Services durch Studierende
und Mitarbeitende. Ebenso ist eine einfachere und sicherere
Administration des Identitätsmanagements möglich
[\[1\]](#ref-switchIntroductionSWITCHaai2024).

Der folgende Artikel gibt einen Überblick über Shibboleth. Zunächst
werden die grundlegenden Begriffe erläutert, gefolgt von einer
detaillierten Darstellung des Prozessablaufs anhand eines
Beispielszenarios. Weiterhin werden die Vor- und Nachteile im Vergleich
zu ähnlichen Softwarelösungen diskutiert. Abschließend wird ein Fazit
gezogen.

Akademische Institutionen profitieren sehr von der Nutzung von
Shibboleth. An der HTWK Leipzig ermöglicht Shibboleth beispielsweise ein
sicheres Identitätsmanagement und den Login mit nur einem Passwort und
Benutzernamen bei verschiedenen Web-Diensten. So ist es möglich, sich
u.a. bei Opal, der HTWK Webseite, AutoTool, den GitLab Instanzen, der
Bibliothek oder wissenschaftliche Ressourcen wie IEEE und Springer mit
ein und den selben Logindaten anzumelden. Die Anmeldung wird über den
HTWK eigenen Identiy Provider durchgeführt und macht die Nutzung der
Services durch Studierende und Mitarbeitende sehr viel einfacher. Auch
das Identitätsmanagement wird dadurch für die Administratoren einfacher
und sicherer.

In diesem Artikel wird ein Überblick über Shibboleth gegeben. Es werden
grundlegende Begriffe erklärt, der Prozessablauf im Detail an einem
Beispielszenario gezeigt und Vor- und Nachteile im Vergleich mit
ähnlichen Softwarelösungen beschrieben.

## 1.2 Grundlegende Begriffe

Im folgenden Abschnitt werden verschiedene theoretische Grundlagen
gelegt und zentrale Begriffe erläutert. Zunächst werden die zentralen
Komponenten sowie der grundlegende Prozessablauf des Shibboleth-Systems
erläutert. Anschließend wird ein Beispiel-Szenario skizziert, auf
welchem die Erklärung in Abschnitt 1.3 basiert.

### 1.2.1 Komponenten

Das Shibboleth-System verwendet insgesamt drei Hautkomponenten während
des Login-Prozesses:

1.  *Identity Provider* (IdP) sind für die Authentifizierung der
    Benutzer:innen zuständig. Sie geben die Informationen über diese an
    den jeweiligen Service Provider weiter. IdPs werden dabei in der
    Home-Organisation der jeweiligen Benutzer:innen verwaltet, d.h.
    dort, wo das entsprechende Benutzerkonto befindet, wie
    beispielsweise Bildungs- und Forschungseinrichtungen
    [\[6\]](#ref-shibbolethShibbolethConcepts2023),
    [\[7\]](#ref-dfnDFNAAIDokumentationEinfuhrung).

2.  *Service Provider* (SP) dienen dem Schutz der eigentlich angefragten
    geschützten Online-Ressourcen und werden innerhalb der sogenannten
    *Ressource Organisation* verwaltet. Sie prüfen die Authentifizierung
    vom IdP, autorisieren die Benutzer:innen basierend auf den
    erhaltenen Informationen und stellen schließlich den Zugriff auf die
    angefragte Ressource bereit
    [\[6\]](#ref-shibbolethShibbolethConcepts2023),
    [\[8\]](#ref-shibbolethServiceProviderApplication2021),
    [\[9\]](#ref-shibbolethServiceProviderProtectContent2021). Service
    Provider können beispielsweise Content-Provider,
    E-Learning-Plattformen, oder Bibliotheken sein
    [\[7\]](#ref-dfnDFNAAIDokumentationEinfuhrung).

3.  *Discovery Services* (DS) unterstützen Service Provider bei der
    Ermittlung des Identity Providers der Benutzer:innen, da die
    Ressource keine Information über die Home-Organisation hat. Sie
    stellen einen Service zur Präsentation eines Standard-Interfaces
    dar, mit welchem die Benutzer:innen ihre Home-Organisation (und
    damit IdP) auswählen können. Somit stellen sie einen *Where Are You
    From Service* (WAYF) dar. DS können mit der Ressource verbunden oder
    als zentraler, geteilter Service betrieben werden
    [\[6\]](#ref-shibbolethShibbolethConcepts2023),
    [\[10\]](#ref-shibbolethIdPDiscoveryShibbolethConcepts2020),
    [\[11\]](#ref-switchSimpleDemoSwitchAAI2024).

### 1.2.2 Grundlegender Ablauf

Der grundlegende Ablauf zum Zugriff auf eine geschützte Ressource
verläuft wie folgt: Zunächst fragt ein:e Benutzer:in den Zugriff auf
eine bestimmte geschützte Ressource bei einem Service Provider an.
Dieser leitet zum Discovery Service weiter, mit welchem der zuständige
Identity Provider des oder der Benutzer:in ermittelt wird. Anschließend
generiert der SP eine Authentifizierungsanfrage und sendet diese an den
ermittelten IdP. Bei diesem findet die Authentifizierung statt. Der SP
verifiziert die Authentifizierungsantwort vom IdP und sendet eine
Anfrage an die Ressource, welche den ursprünglich angefragten Inhalt
zurückgibt [\[6\]](#ref-shibbolethShibbolethConcepts2023),
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[13\]](#ref-michelsIdentityManagementUnd). Der Ablauf ist in
Abbildung 1 skizziert.

<figure id="fig:grundlegender-ablauf">
<img src="../assets/basic_interaction_article.drawio.svg"
alt="Abbildung 1: Grundlegender Ablauf (nach Beschreibungen aus [6], [12], [13])" />
<figcaption aria-hidden="true">Abbildung 1: Grundlegender Ablauf (nach
Beschreibungen aus <span class="citation"
data-cites="shibbolethShibbolethConcepts2023 switchExpertDemoSWITCHaai2024a michelsIdentityManagementUnd"><a
href="#ref-shibbolethShibbolethConcepts2023"
role="doc-biblioref">[6]</a>, <a
href="#ref-switchExpertDemoSWITCHaai2024a"
role="doc-biblioref">[12]</a>, <a
href="#ref-michelsIdentityManagementUnd"
role="doc-biblioref">[13]</a></span>)</figcaption>
</figure>

### 1.2.3 Szenario

In den weiterführenden Abschnitten soll das folgende Szenario genauer
beleuchtet werden. Eine Benutzerin der Universität A (`uni-a.example`)
möchte auf eine geschützte “Ressource B” zugreifen. Diese wird auf der
Seite `pool.example/resource-b` angeboten. Der Discovery Service ist
dabei unter `discovery.pool.example` und der Identity Provider der Home
Organisation (hier Universität A) unter `idp.uni-a.example` erreichbar.

<!-- Universität A:      uni-a.example -->

<!-- IdP:                idp.uni-a.example           https://aai-demo-idp.switch.ch -->

<!-- Ressource:          pool.example/resource-b     https://aai-demo.switch.ch/secure/ -->

<!-- Discovery Service:  discovery.pool.example      https://wayf-test.switch.ch -->

## 1.3 Prozessablauf im Detail

In diesem Abschnitt wird der vereinfachte Prozessablauf, welcher in
Abschnitt 1.2.3 dargestellt wurde, vertiefend erklärt. Dabei soll das
dort eingeführte Szenario verfolgt werden. Der Prozess erfolgt in drei
übergeordneten Phasen:

1.  Erster Zugriff auf den Service Provider und Identity Provider
    Discovery (siehe Abbildung 2)
2.  Session Initialisierung und Authentifizierungsanfrage (siehe
    Abbildung 3)
3.  Authentifizierung, Autorisierung und Ressourcenzugriff (siehe
    Abbildung 4) [\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
    [\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).

Die einzelnen Phasen werden im Folgenden genauer erläutert und als
*Business Process Model and Notation* (BPMN) Diagrammen dargestellt. Die
erste Phase ist dabei in grün, die zweite in orange und die dritte in
lila markiert. Ein BPMN-Diagramm, welches alle drei Phasen enthält, kann
[online](https://raw.githubusercontent.com/nicosrm/24-bis-shibboleth/refs/heads/main/assets/bis_bpmn.drawio.pdf)[^1]
eingesehen werden.

### 1.3.1 Phase 1: Identity Provider Discovery

Im folgenden Abschnitt wird die erste Phase des Login-Prozesses mittels
Shibboleth erläutert. Dabei handelt es sich um den ersten Zugriff einer
Benutzerin oder eines Benutzers auf eine geschützte Ressource, d.h. auf
den Service Provider. Dabei ist diese Person noch *nicht* beim
jeweiligen Identity Provider angemeldet, sodass die *Identity Provider
Discovery* stattfinden muss. Der Prozess ist als BPMN-Diagramm in
Abbildung 2 dargestellt.

<figure id="fig:phase1-idp-discovery">
<img src="../assets/bis_bpmn_phase_1.drawio.svg"
alt="Abbildung 2: BPMN-Diagramm zu Phase 1 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [12])" />
<figcaption aria-hidden="true">Abbildung 2: BPMN-Diagramm zu Phase 1 des
Login-Prozesses mittels Shibboleth (nach Beschreibung aus <span
class="citation" data-cites="switchExpertDemoSWITCHaai2024a"><a
href="#ref-switchExpertDemoSWITCHaai2024a"
role="doc-biblioref">[12]</a></span>)</figcaption>
</figure>

Zunächst greift die Benutzerin erstmalig auf die geschützte Ressource
zu. Dabei wird folgende `GET`-Request gestellt:

    GET https://www.pool.example/resource-b

Da die angefragte Ressource über das Shibboleth-System, insbesondere den
Service Provider, geschützt ist, wird die Anfrage vom Service Provider
geprüft. Dabei wird kontrolliert, ob bereits eine aktive
Shibboleth-Session vorliegt, d.h. ob die Nutzerin bereits
authentifiziert ist. Diese Information wäre im `_shibsession`-Cookie
enthalten. Falls dieser aktuell und gültig ist, wird die Benutzerin
schlussendlich an die Ressource weitergeleitet. Dieses Szenario wird in
Abschnitt 1.3.3 genauer erläutert
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).

Falls jedoch noch keine aktive Shibboleth-Session vorliegt, wird die
Benutzerin zum Discovery Service weitergeleitet. Da die Information,
wohin die Benutzenden nach Auswahl der Home Organisation geschickt
werden sollen, nicht verloren gehen darf, wird der `_shibstate`-Cookie
gesetzt und Parameter mitgesendet. In neueren Shibboleth-Versionen wird
dies mittels *Relay State*-Mechanismen gespeichert
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).
<!-- TODO: ggf. Relay-State erklären -->

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

Der Discovery Service ermittelt nun die Liste der verfügbaren bzw.
unterstützten Identity Provider, welche im folgenden der Nutzerin
präsentiert werden. Diese wählt ihren zutreffenden Identity Provider aus
– in diesem Szenario entsprechend Universität A (`idp.uni-a.example`).
Daher wird die Nutzerin im Anschluss an den ausgewählten Identity
Provider der Home Organisation weitergeleitet
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a).

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

### 1.3.2 Phase 2: Session Initialisierung und Authentifizierungsanfrage

In Phase 2 wird die Session initialisiert und eine
Authentifizierungsanfrage gestellt. Der Prozess ist als BPMN-Diagramm in
Abbildung 3 dargestellt.

<figure id="fig:phase2-session-auth">
<img src="../assets/bis_bpmn_phase_2.drawio.svg"
alt="Abbildung 3: BPMN-Diagramm zu Phase 2 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [12])" />
<figcaption aria-hidden="true">Abbildung 3: BPMN-Diagramm zu Phase 2 des
Login-Prozesses mittels Shibboleth (nach Beschreibung aus <span
class="citation" data-cites="switchExpertDemoSWITCHaai2024a"><a
href="#ref-switchExpertDemoSWITCHaai2024a"
role="doc-biblioref">[12]</a></span>)</figcaption>
</figure>

Aufgrund des vorherigen Redirects zum Identity Provider der Home
Organisation der Benutzerin, sendet der Browser nun eine `GET`-Request
an den IdP. Der *Session Initiator* erstellt weiterhin eine
Authentifizierungsanfrage (AuthN), welche automatisch mittels JavaScript
abgesendet wird [\[12\]](#ref-switchExpertDemoSWITCHaai2024a).

    GET https://pool.example/shibboleth/Login
      ?SAMLDS=1
      &target=ss:mem
      &entityID=https://idp.uni-a.example/shibboleth

    POST https://idp.uni-a.example/profile/SAML2/POST/SSO
      POSTDATA
        RelayState=ss:mem:23e3a3b1268acd89dc226bb1ce0d0c6ba7ecf773
        SAMLRequest=PHNhbWxwOkF1dGhuUmVxdWVzdCB4bWxuczp...

Der IdP prüft anschließend die Authentifizierungsanfrage. Wenn diese
gültig ist, wird zunächst festgestellt, ob die Nutzerin bereits
authentifiziert ist. Dies wird anhand des `_idp_session`-Cookies
überprüft. Falls dem nicht so ist, wird eine geeignete
Authentifizierungsmethode für die Benutzerin, basierend auf dem
Protokoll des Service Providers, ausgewählt. Die Benutzerin wird
anschließend an einen kompatiblen Login-Handler weitergeleitet
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019). Dieses
Szenario wird in Abschnitt 1.3.3 genauer beschrieben.

In diesem Beispiel soll ein Nutzername und Passwort zur
Authentifizierung verwendet werden. Bei diesem Redirect wird vom IdP ein
AuthN-Cookie gesetzt, welcher Informationen zur Ressource und einen
Authentifizierungstoken enthält. Anschließend wird die Nutzerin zur
tatsächlichen, spezifischen Anmeldeseite weitergeleitet
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a).

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

### 1.3.3 Phase 3: Ressourcenzugriff

In der letzten Phase kommt es schließlich zum Ressourcenzugriff. Der
Ablauf wird im folgenden beschrieben und ist als BPMN-Diagramm in
Abbildung 4 dargestellt.

<figure id="fig:phase3-ressourcen-zugriff">
<img src="../assets/bis_bpmn_phase_3.drawio.svg"
alt="Abbildung 4: BPMN-Diagramm zu Phase 3 des Login-Prozesses mittels Shibboleth (nach Beschreibung aus [12])" />
<figcaption aria-hidden="true">Abbildung 4: BPMN-Diagramm zu Phase 3 des
Login-Prozesses mittels Shibboleth (nach Beschreibung aus <span
class="citation" data-cites="switchExpertDemoSWITCHaai2024a"><a
href="#ref-switchExpertDemoSWITCHaai2024a"
role="doc-biblioref">[12]</a></span>)</figcaption>
</figure>

Auf der Anmeldeseite des Identity Providers gibt die Benutzerin
anschließend ihre Anmeldedaten ein. Diese werden mittels `POST`-Request
an den IdP geschickt, welche den AuthN-Cookie enthält
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a).

    POST https://idp.uni-a.example/Authn/UserPassword
      POSTDATA
        j_username=demouser
        j_password=demo

      Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996

Nach erfolgreicher Verifikation der Anmeldedaten durch den IdP, findet
das *Attribute Resolving* und *Filtering* statt. Die erhaltenen Daten
werden basierend auf den Protokollen und der Konfiguration des Service
Providers durch einen Attribut-Filter auf die unbedingt notwendigen
Daten reduziert, um ein Maß von Datenschutz zu gewährleisten.
Anschließend wird eine HTML-Seite generiert, welche eine *SAML
Assertion* beinhaltet. Letztere umfasst das Authentifizierungsstatement
sowie das *Attribute-Statement*, welches die Nutzerattribute enthält.
Die Daten werden in eine geeignete Form transformiert und ggf.
verschlüsselt sowie signiert. Die Assertion wird daraufhin automatisch
abgesendet. Zudem wird nun der `_idp_session`-Cookie gesetzt, der bei
einer erneuten Authentifizierung durch denselben IdP ausgewertet wird.
Direkt im Anschluss sendet der Browser eine `POST`-Request an den
Service Provider, die sowohl die *SAML-Response* als auch den
`_shibstate`-Cookie enthält
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).

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

Anschließend verarbeitet der Service Provider die SAML-Assertion sowie
die Authentifizierungs- und Attribut-Statements. Dabei werden die
Attribute sowie andere Informationen aus der Nachricht extrahiert und
eine neue User-Session erstellt. Schließlich wird die Nutzerin zur
angefragten Ressource weitergeleitet, wobei ein Verweis auf die
Ressource im `_shibstate`-Cookie bzw. Relay-State hinterlegt wird.
Weiterhin wird der `_shibsession`-Cookie gesetzt, wodurch ein erneuter
Zugriff auf den Service Provider (innerhalb einer bestimmten Zeit)
direkt als authentifiziert gilt
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a),
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).

    302 FOUND (REDIRECT)
      Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=
        path=/

      Set-Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0
        path=/

      Location: https://pool.example/resource-b

Schlussendlich findet eine erneute Anfrage an die geschützte Ressource
(`pool.example/resource-b`) durch den Browser statt, welcher den
`_shibsession`-Cookie enthält.
[\[14\]](#ref-shibbolethFlowsAndConfigShibbolethConcepts2019).

    GET https://pool.example/resource-b
      Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0

Erneut wird der `_shibsession`-Cookie überprüft, wodurch diesmal eine
aktive Shibboleth-Session erkannt wird. Somit kann die Autorisierung
stattfinden, d.h. die Überprüfung, ob die Benutzerin über die
notwendigen Rechte zum Zugriff auf die gewünschte Ressource verfügt. Die
Rechte werden über alle anwendbaren *Access-Control*-Plugins, bspw.
*Shibboleth Access Rules*, ermittelt, wobei unter anderem die
Benutzer-Attribute abgeglichen werden. Da die Benutzerin in dem Fall
über die notwendigen Rechte verfügt, wird der Zugriff schlussendlich auf
die initial angefragte, geschützte Ressource gewährt
[\[12\]](#ref-switchExpertDemoSWITCHaai2024a).

    200 OK
      [RESOURCE HTML PAGE]

## 1.4 Diskussion

Im folgenden Abschnitt wird Shibboleth diskutiert. Dabei wird auf die
Vorteile und Nachteile eingegangen und verschiedene Alternativen
beleuchtet. Abschließend wird ein kurzer Einblick in die Agenda der
nahen Zukunft gegeben.

Shibboleth ist seit 2000 in Verwendung und hat sich seitdem zu einem
etablierten SSO-System entwickelt
[\[2\]](#ref-shibbolethShibbolethConsortium2024). Grundsätzlich fallen
als Open Source Software keine Kosten an. Das *Shibboleth Consortium*
bietet allerdings kostenpflichtige Mitgliedschaften an, die das Projekt
finanzieren und den Mitgliedern Hilfestellungen (*Support*) sowie
weitere Partizipationsmöglichkeiten bieten
[\[2\]](#ref-shibbolethShibbolethConsortium2024),
[\[15\]](#ref-shibbolethMembership). Dabei wird ein jährlicher Beitrag
erhoben, der auf der Art und Größe der Institution basiert
[\[16\]](#ref-shibbolethConsortiumMembershipFees). Größere Mitglieder
sind unter anderem der Verein zur Förderung eines Deutschen
Forschungsnetzes (DFN-Verein), die Stanford University, die University
of Oxford oder das Massachusetts Institute of Technology (MIT)
[\[4\]](#ref-shibbolethOurMembers2024). Shibboleth unterstützt
verschiedene Standardprotokolle wie beispielsweise SAML, OpenID Connect
und LDAP [\[3\]](#ref-cantorConsortiumFAQShibboleth2023),
[\[17\]](#ref-overtsoftwareAzureADADFS2022). Außerdem ist es
Windows-unabhängig und dezentral
[\[17\]](#ref-overtsoftwareAzureADADFS2022).

Shibboleth ist nicht für Unternehmen gedacht, welche hauptsächlich
interne Zugriffsverwaltung und Authentifizierung benötigen. Vielmehr
unterstützt es den Austausch von Authentifizierungsdaten zwischen
verschiedenen, teils externen Organisationen (föderierte Identitäten).
Weiterhin ist eine eigenverantwortliche Administration notwendig
[\[3\]](#ref-cantorConsortiumFAQShibboleth2023).

### 1.4.1 Alternativen

Eine Alternative zu Shibboleth ist *Active Directory* (AD), bei der es
sich um ein On-Premise Identitätsmanagementsystem
handelt[\[18\]](#ref-sommergutWasSindUnterschiede2019), welches sich
besonders gut für Windows-Umgebungen eignet. Die Einrichtung und
Verwaltung ist jedoch komplex und es wird kein Web-basiertes SSO
angeboten.

Ein alternatives Identitätsmanagementsystem mit SSO ist *Azure Active
Directory* (AAD) bzw. *Microsoft Entra ID*
[\[19\]](#ref-chikMicrosoftEntraExpands2023),
[\[20\]](#ref-celestedgNewNameAzure2024), welches im Vergleich zu AD
Cloud-basiert ist und Microsoft Abhängigkeiten besitzt
[\[18\]](#ref-sommergutWasSindUnterschiede2019). Dadurch eignet sich
Microsoft Entra ID besonders für Unternehmen, die vollständig in
Microsoft 365 und Azure integriert sind.

Darüber hinaus gibt es weitere kostenpflichtige Alternativen wie *Okta*,
*OneLogin* oder *Ping Identity*, welche ebenfalls Cloud-basierte
Lösungen sind und den Fokus auf unterschiedliche Aspekte wie Sicherheit
oder Benutzerfreundlichkeit legen [\[21\]](#ref-oktaSecureSingleSignOn),
[\[22\]](#ref-oneloginErweiterteAuthentifizierung),
[\[23\]](#ref-pingidentityFunktionenPingIdentityPlattform).

### 1.4.2 Zukunft

Die Agenda von Shibboleth sieht vor, bis 2027 die passwortlose
Authentifikation zu ermöglichen, sodass Nutzer:innen beispielsweise mit
FIDO, WebAuthn und Passkeys vom Login-Handler authentifiziert werden
können. Zudem sollen *Digital Wallets* und verifizierte Anmeldedaten
angegangen werden, wobei die Hauptrolle darin gesehen wird, ein
Aussteller dieser zu werden oder sie zu verifizieren
[\[24\]](#ref-shibbolethDevelopmentCenterProject2024).

Verbessert werden soll die Produktdokumentation und Konfiguration der
IdPs, um einen Fokus auf Konzepte, einleitendes Material und Beispiele
zu legen. Dies geht einher mit der Neukonzeption der SPs, welche
zukünftig als Plugin für IdPs eingeführt werden sollen
[\[24\]](#ref-shibbolethDevelopmentCenterProject2024).

Darüber hinaus soll die *OpenID Federation* unterstützt werden, um die
Harmonie zwischen den SAML und OpenID Metadaten zu verstärken. Außerdem
sollen weitere UI-Komponenten zum IdP hinzugefügt werden, welche sich
unter anderem mit dem Management von Login-Aktivitäten sowie einer
passwortlosen Authentifikation befassen
[\[24\]](#ref-shibbolethDevelopmentCenterProject2024).

## 1.5 Zusammenfassung

Shibboleth ist ein sich weiterentwickelndes Web-basiertes SSO und
Identitätsmanagementsystem, bestehend aus drei Komponenten: Identity
Provider (IdP), Service Provider (SP) und Discovery Service (DS).

Zuständig für die Verwaltung der geschützten Ressourcen ist der SP,
welcher bei einer Zugriffsanfrage nach einer aktiven Session und
Autorisierung prüft. Besteht keine aktive Session, stellt der DS zur
Ermittlung des zuständigen IdPs der oder dem Benutzer:in eine Auswahl
von Home-Organisations. Der ausgewählte IdP authentifiziert anschließend
die oder den Benutzer:in und schickt erneut eine Zugriffsanfrage an den
SP.

Dieses Verfahren ermöglicht den Austausch von Authentifizierungsdaten
auch zwischen verschiedenen externen Organisationen und wird dadurch vor
allem von föderierten Institutionen eingesetzt. Als Open Source Software
fallen keine Kosten an, es gibt aber die Möglichkeit einer
kostenpflichtigen Mitgliedschaft, welche unter anderem Support für die
ansonsten eigenverantwortliche Administration anbietet.

## 1.6 Literatur

<div id="refs" class="references csl-bib-body" entry-spacing="0">

<div id="ref-switchIntroductionSWITCHaai2024" class="csl-entry">

<span class="csl-left-margin">\[1\]
</span><span class="csl-right-inline">SWITCH, „Introduction - About -
SWITCHaai“. Zugegriffen: 17. November 2024. \[Online\]. Verfügbar unter:
<https://help.switch.ch/aai/about/introduction/></span>

</div>

<div id="ref-shibbolethShibbolethConsortium2024" class="csl-entry">

<span class="csl-left-margin">\[2\]
</span><span class="csl-right-inline">Shibboleth, „Shibboleth
Consortium“. Zugegriffen: 29. Oktober 2024. \[Online\]. Verfügbar unter:
<https://www.shibboleth.net/></span>

</div>

<div id="ref-cantorConsortiumFAQShibboleth2023" class="csl-entry">

<span class="csl-left-margin">\[3\]
</span><span class="csl-right-inline">S. Cantor, „Consortium FAQ -
Shibboleth Consortium“. Zugegriffen: 29. Oktober 2024. \[Online\].
Verfügbar unter:
<https://shibboleth.atlassian.net/wiki/spaces/consort/pages/2913075221></span>

</div>

<div id="ref-shibbolethOurMembers2024" class="csl-entry">

<span class="csl-left-margin">\[4\]
</span><span class="csl-right-inline">Shibboleth, „Our Members“.
Zugegriffen: 29. Oktober 2024. \[Online\]. Verfügbar unter:
<https://www.shibboleth.net/about-us/members/></span>

</div>

<div id="ref-hochschulefuertechnikwirtschaftundkulturleipzigMedienOnlineNutzen"
class="csl-entry">

<span class="csl-left-margin">\[5\]
</span><span class="csl-right-inline">Hochschule für Technik, Wirtschaft
und Kultur Leipzig, „Medien online nutzen“. Zugegriffen: 14. Januar
2025. \[Online\]. Verfügbar unter:
<https://bibliothek.htwk-leipzig.de/ausleihe-und-nutzung/medien-online-nutzen></span>

</div>

<div id="ref-shibbolethShibbolethConcepts2023" class="csl-entry">

<span class="csl-left-margin">\[6\]
</span><span class="csl-right-inline">Shibboleth, „Shibboleth Concepts“.
Zugegriffen: 29. Oktober 2024. \[Online\]. Verfügbar unter:
<https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/overview></span>

</div>

<div id="ref-dfnDFNAAIDokumentationEinfuhrung" class="csl-entry">

<span class="csl-left-margin">\[7\]
</span><span class="csl-right-inline">DFN, „DFN-AAIDokumentation
Einführung“. Zugegriffen: 24. November 2024. \[Online\]. Verfügbar
unter: <https://doku.tid.dfn.de/de:aai:about></span>

</div>

<div id="ref-shibbolethServiceProviderApplication2021"
class="csl-entry">

<span class="csl-left-margin">\[8\]
</span><span class="csl-right-inline">Shibboleth, „Service Provider -
Application Model“. Zugegriffen: 24. November 2024. \[Online\].
Verfügbar unter:
<https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334314/ApplicationModel></span>

</div>

<div id="ref-shibbolethServiceProviderProtectContent2021"
class="csl-entry">

<span class="csl-left-margin">\[9\]
</span><span class="csl-right-inline">Shibboleth, „Service Provider -
ProtectContent“. Zugegriffen: 24. November 2024. \[Online\]. Verfügbar
unter:
<https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335066/ProtectContent></span>

</div>

<div id="ref-shibbolethIdPDiscoveryShibbolethConcepts2020"
class="csl-entry">

<span class="csl-left-margin">\[10\]
</span><span class="csl-right-inline">Shibboleth, „IdPDiscovery -
Shibboleth Concepts“. Zugegriffen: 17. November 2024. \[Online\].
Verfügbar unter:
<https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263></span>

</div>

<div id="ref-switchSimpleDemoSwitchAAI2024" class="csl-entry">

<span class="csl-left-margin">\[11\]
</span><span class="csl-right-inline">SWITCH, „Simple Demo - SwitchAAI“.
Zugegriffen: 24. November 2024. \[Online\]. Verfügbar unter:
<https://help.switch.ch/aai/demo/simple/></span>

</div>

<div id="ref-switchExpertDemoSWITCHaai2024a" class="csl-entry">

<span class="csl-left-margin">\[12\]
</span><span class="csl-right-inline">SWITCH, „Expert Demo - SWITCHaai“.
Zugegriffen: 24. November 2024. \[Online\]. Verfügbar unter:
<https://help.switch.ch/aai/demo/expert/></span>

</div>

<div id="ref-michelsIdentityManagementUnd" class="csl-entry">

<span class="csl-left-margin">\[13\]
</span><span class="csl-right-inline">T. Michels, „Identity Management
und Shibboleth: Ein Überblick“.</span>

</div>

<div id="ref-shibbolethFlowsAndConfigShibbolethConcepts2019"
class="csl-entry">

<span class="csl-left-margin">\[14\]
</span><span class="csl-right-inline">Shibboleth, „FlowsAndConfig -
Shibboleth Concepts“. Zugegriffen: 6. November 2024. \[Online\].
Verfügbar unter:
<https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645290/FlowsAndConfig></span>

</div>

<div id="ref-shibbolethMembership" class="csl-entry">

<span class="csl-left-margin">\[15\]
</span><span class="csl-right-inline">Shibboleth, „Membership“.
Zugegriffen: 17. November 2024. \[Online\]. Verfügbar unter:
<https://www.shibboleth.net/membership/></span>

</div>

<div id="ref-shibbolethConsortiumMembershipFees" class="csl-entry">

<span class="csl-left-margin">\[16\]
</span><span class="csl-right-inline">Shibboleth, „Consortium Membership
Fees“. Zugegriffen: 17. November 2024. \[Online\]. Verfügbar unter:
<https://www.shibboleth.net/membership/consortium-membership-fees/></span>

</div>

<div id="ref-overtsoftwareAzureADADFS2022" class="csl-entry">

<span class="csl-left-margin">\[17\]
</span><span class="csl-right-inline">Overt Software, „Azure AD/ADFS vs
Shibboleth IDP“. Zugegriffen: 17. November 2024. \[Online\]. Verfügbar
unter:
<https://www.overtsoftware.com/azure-ad-adfs-vs-shibboleth-idp-which-is-better-for-your-organisation/></span>

</div>

<div id="ref-sommergutWasSindUnterschiede2019" class="csl-entry">

<span class="csl-left-margin">\[18\]
</span><span class="csl-right-inline">W. Sommergut, „Was Sind Die
Unterschiede Zwischen Active Directory Und Azure AD? \| WindowsPro“.
Zugegriffen: 17. November 2024. \[Online\]. Verfügbar unter:
<https://www.windowspro.de/wolfgang-sommergut/was-sind-unterschiede-zwischen-active-directory-azure-ad></span>

</div>

<div id="ref-chikMicrosoftEntraExpands2023" class="csl-entry">

<span class="csl-left-margin">\[19\]
</span><span class="csl-right-inline">J. Chik, „Microsoft Entra Expands
into Security Service Edge and Azure AD Becomes Microsoft Entra ID“.
Zugegriffen: 17. November 2024. \[Online\]. Verfügbar unter:
<https://www.microsoft.com/en-us/security/blog/2023/07/11/microsoft-entra-expands-into-security-service-edge-and-azure-ad-becomes-microsoft-entra-id/></span>

</div>

<div id="ref-celestedgNewNameAzure2024" class="csl-entry">

<span class="csl-left-margin">\[20\]
</span><span class="csl-right-inline">CelesteDG, „New Name for Azure
Active Directory - Microsoft Entra“. Zugegriffen: 17. November 2024.
\[Online\]. Verfügbar unter:
<https://learn.microsoft.com/en-us/entra/fundamentals/new-name></span>

</div>

<div id="ref-oktaSecureSingleSignOn" class="csl-entry">

<span class="csl-left-margin">\[21\]
</span><span class="csl-right-inline">Okta, „Secure Single Sign-On
Solutions“. Zugegriffen: 2. Januar 2025. \[Online\]. Verfügbar unter:
<https://www.okta.com/de-de/products/single-sign-on-customer-identity/></span>

</div>

<div id="ref-oneloginErweiterteAuthentifizierung" class="csl-entry">

<span class="csl-left-margin">\[22\]
</span><span class="csl-right-inline">OneLogin, „Erweiterte
Authentifizierung“. Zugegriffen: 2. Januar 2025. \[Online\]. Verfügbar
unter: <https://www.oneidentity.com/></span>

</div>

<div id="ref-pingidentityFunktionenPingIdentityPlattform"
class="csl-entry">

<span class="csl-left-margin">\[23\]
</span><span class="csl-right-inline">Ping Identity, „Funktionen der
Ping Identity-Plattform“. Zugegriffen: 2. Januar 2025. \[Online\].
Verfügbar unter:
<https://www.pingidentity.com/de/platform/capabilities.html></span>

</div>

<div id="ref-shibbolethDevelopmentCenterProject2024" class="csl-entry">

<span class="csl-left-margin">\[24\]
</span><span class="csl-right-inline">Shibboleth, „Development Center -
Project Roadmap“. Zugegriffen: 12. Januar 2025. \[Online\]. Verfügbar
unter:
<https://shibboleth.atlassian.net/wiki/spaces/DEV/pages/3503423489/Project+Roadmap></span>

</div>

</div>

[^1]: <https://raw.githubusercontent.com/nicosrm/24-bis-shibboleth/refs/heads/main/assets/bis_bpmn.drawio.pdf>
