## Masterarbeit: Automatisierte Videozusammenfassung von Fußballspielen auf Basis gelernter Events

### Kontext

[Scoutastic](https://www.scoutastic.com/) ist eine datengetriebene Fußball-Scouting-Plattform, die Daten aus verschiedenen Quellen aggregiert und so die Analyse von Scouting-Aktivitäten vereinfacht. Zu den Quellen zählen sowohl strukturierte Daten (z.B. aus Fragebögen), sowie unstrukturierte Daten aus Spielerberichten, die bereits mithilfe von NLU-Technologien transformiert werden. Zusätzlich sollen Spieldaten einfließen, die allerdings nicht für jede Liga öffentlich verfügbar sind oder nicht ordentlich erfasst werden. Für diese Fälle sollen Spieldaten auf der Basis von Videoaufzeichnungen generiert werden.

### Problemstellung

Dem Betreiber der Plattform, [JUST ADD AI](https://justadd.ai/), liegen die offiziellen Videoaufzeichnungen diverser Bundesligaspiele, sowie Listen erfasster Events vor, welche direkt von der Deutschen Fußball Liga (DFL) bezogen werden. Die Events umfassen z. B. Fouls, Torschüsse, Zweikämpfe oder Pässe, die wiederum mit Zeitstempeln, Positionen und Spielern verknüpft sind. 

Ziel ist es, ein auf Deep-Learning basierendes K.I.-System zu entwickeln, das lernt wann sich solche Events in einem Videomitschnitt ereignen. Deep Learning ist ein Teilgebiet des Maschinellen Lernens, das sich besonders bei komplexen Daten anbietet, da die notwendigen Abstraktionsschichten implizit mit erlernt werden können und ein manuelles Feature-Engineering entfällt.

Dazu werden öffentlich verfügbare TV-Aufzeichnungen von Spielen segmentiert und die Sequenzen des Videos bilden den Input des Modells. Der Output entspricht dann einer Liste potentieller Events, die sich innerhalb der Sequenz ereignen. So können die erkannten Events anschließend mit der Spielzeit verknüpft werden.

![model](../Thesis/src/model.svg)

Die Fragestellung ist, ob ein ausgewähltes Modell anhand von Bildern und Bewegungen, die Zusammenhänge korrekt abstrahieren kann um die verschiedenen Event-Typen sicher erkennen und unterscheiden zu können. Für das Training wird entsprechende Hardware von der Firma bereitgestellt.

Der Gegenstand der Masterarbeit schließt folgende Punkte ein:

* Aufbereiten von Video- und Event-Daten
  
  Die zur Verfügung stehenden Videos erstrecken sich über den gesamten Zeitraum des Spiels (inkl. Halbzeitpause), sowie einige Minuten davor und danach. Die einzige zeitliche Referenz ist die Spielzeitanzeige oben rechts im Videobild. Die Event-Daten sind hingegen mit einem genauen Zeitstempel versehen (darunter auch die Zeit von Anstoß und Abpfiff). Beide Quellen müssen synchronisiert werden, sodass das Video mit der ersten Spielminute beginnt.
  
  Diese Aufgabe kann mithilfe von OCR (optical character recognition) gelöst werden, indem der Text aus der Spielzeitanzeige extrahiert wird. Mit wenigen zufällig gewählten Frames lässt sich so der Zeitpunkt des Anstoßes innerhalb des Videos feststellen.
  
* Recherche geeigneter Action-Classification-Modelle

  In der Bildverarbeitung sind insbesondere CNNs vorherrschend, während RNNs ihre Stärken bei der Verarbeitung von Sequenzdaten ausspielen. Auch kombinierte Ansätze, wie 3D-CNNs finden sich in ähnlichen Anwendung.

  Die Modelle lernen in den meisten Fällen mit Beispielen aus Tupeln. Für jedes bekannte Event wird ein Tupel aus der Klasse und einem kurzen Videosegment generiert. Das Segment stellt ein kurzes Zeitfenster um den erfassten Zeitpunkt des Events dar.

* Anwendung und Optimierung eines geeigneten Modells

  Der Hauptteil der Arbeit ist ein geeignetes Modell aus der Literatur zu wählen und anzupassen. Das Modell soll bestimmte Typen von Events erlernen können.

  Indem man sich zunächst auf visuell leicht erkennbare Events beschränkt, können schon frühzeitig erste Eindrücke gewonnen werden, was leicht und was schwieriger zu lernen ist.

* Implementation einer Benutzeroberfläche
  
  Für den Anwender soll eine Oberfläche gebaut werden, indem er sich jedes Spiel ansehen kann und die gefundenen Events überprüfen kann.
  
  Darüber hinaus kann der Nutzer eigene Videos hochladen und sich die gefundenen Events ansehen.
  
* Auswertung der Ergebnisse

  Mithilfe eines Test-Sets wird die Genauigkeit des Modells berechnet. Dazu werden die Erkennungsraten der jeweiligen Event-Typen verglichen und mögliche Einflussfaktoren herausgearbeitet.

