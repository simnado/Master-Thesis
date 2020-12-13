## Event Mapping

Global: off_camera herausfiltern

* 50/50 (33): 2 players challenging to recover a loose ball. :green_apple:
  * Doppelt pro Team
* Bad_Behavior (23): When a player receives a card due to an infringement outside of play. :green_apple:
  * Split: Card.name: 65 / “Yellow Card” 66 / “Second Yellow" 67 / “Red Card”
* Ball_Recovery (2): An attempt to recover a loose ball
  * Doppelt: Folgt auf Pass von Opponent mit Outcome = 'Incomplete'
  * Filter: leadstoout, recovery failure?
* Block (6): Blocking the ball by standing in its path. :green_apple:
  * Filter: deflection? (besonders schwer)
* Camera_On (5): Signals the stop of the camera to capture gameplay for a replay/video cut.
  * :warning: Deprecated -> use off_camera Attribute 
* Camera_Off: Bird View to zoom in
  * :warning: Deprecated -> use off_camera Attribute 
* Clearance (9): Action by a defending player to clear the danger without an intention to deliver it to a teammate.
  * Schwer, weil langer Kontext (Verwechselung mit SHOT)
  * Filter: areal? (in der Luft)
* Dispossessed (3): Player loses ball to an opponent as a result of being tackled by a defender without attempting a dribble
  * Related: Duel, Pressure
* Dribble (14): An attempt by a player to beat an opponent 
  * Filter: No Touch
  * Split: Nutmeg, , Overrun :green_apple:
* Dribbled_Past (39): Player is dribbled past by an opponent :green_apple:
* Duel (4): A duel is an 50-50 contest between two players of opposing sides in the match.
  * Split: 
    * Type=ArealLost
    * Type=Tackle
      * Outcome: Succes or Fail (schwer wegen Länge) :warning:
* Error (37): When a player is judged to make an on-the-ball mistake that leads to a shot on goal
  * :warning: kann alles sein? (Handspiel, Torwartfehler, ...) -> Subjektiv
* Foul_Commited (22): Any infringement that is penalised as foul play by a referee. Offside are not tagged as a foul committed
  * :warning: card property :green_apple:
  * Split
    * 19 / "6 seconds" -> zu langer Kontext (vs. Injury, stoppage)
    * 20 / "Backpass Pick"
    * 21 / "Dangerous Play"  :green_apple:
    * 22 / "Dive"
    * 23 / "Foul Out" :question:
    * 24 / "Handball" :green_apple:
* Goal_Keeper (23): Actions that can be done by the goalkeeper.
  * Split: 
    * Type=GoalConcede, Penalty Conceded :green_apple:
    * Type=Save, Penalty Saved, SHot Saved, Punch :green_apple:
    * Type=“Collected” :green_apple:
    * Type=Punch :green_apple:
    * Type=Smother, Sweeper :warning: Context (wer is keeper)
* Half_End (34): Signals the referee whistle to finish a match part  :green_apple:
  * Doppelt pro Team :green_apple:
* Injury_Stoppage (39): A stop in play due to an injury :green_apple:
* Interception (10): Preventing an opponent's pass from reaching their teammates by moving to the passing lane/reacting to intercept it. :green_apple:
* Miscontrol (38): Player loses ball due to bad touch :green_apple:
  * Schwierig
* Offside (8): Offside infringement. Cases resulting from a shot or clearance (non-pass). For passes resulting in an offside check pass outcomes section. :green_apple:
  * Schwierig
* Own_Goal_Against (20): An own goal scored against the team
  * Doppelt mit OG_For
  * :warning: schwer wegen Unterscheidung der Mannschaften
* Own_Goal_For (25): An own goal scored for the team
  * Doppelt s.o.
* Pass (30): Ball is passed between teammates.
  * Filter: Outcome=undefined
  * Split: 
    * Height: HighPass
    * Backheel :green_apple: cross :green_apple:
    * Type: 
      * Corner :green_apple:
      * GoalKick :green_apple:
      * FreeKick :green_apple:
      * ThrowIn :green_apple:
      * KickOff :green_apple:
* Player_Off (27): A player goes/ is carried out of the pitch without a substitution.
  * Schwierig: oft nicht zu sehen
  * Doppelt mit Related Player_On :red_circle:
* Player_On (26): A player returns to the pitch after a Player Off event. :red_circle:
  * s.o.
* Pressure (17): Applying pressure to an opposing player who’s receiving, carrying or releasing the ball.
  * Duration
  * :red_circle:
* Referee_Ball_Drop (41): Referee drops the ball to continue the game after an injury stoppage :green_apple:
  * Doppelt pro Team
* Shield (28): Player shields ball going out of bounds to prevent opponent from keeping it in play.
  * :green_apple:
* Shot (16): An attempt to score a goal, made with any (legal) part of the body.
  * Split: 
    * Technique?
    * Type:
      * Corner :green_apple: , Freekick :green_apple: , Penalty :green_apple: , Kickoff
    * Type=OpenPlay
      * Oucome=goal -> Goal :green_apple:
      * Outcome=Off T
      * Outcome=Posts
* Substitution (19) :green_apple:
  * Related: -

### Attribute

* play_pattern: From Corner, Free Kick, Throw In, Other, Counter, Goal Kick, Keeper, Kick Off
* Duration: Seconds of action
* Under_pressure: 
* Off_camera
* Out: Added if the outcome of the event is the ball going out of bounds.

#### Beobachtung

* Events bis zu 4 sek zu spät (5e8ccee6a07bf90ea68c4f2a)



# Roadmap

1. Build Soccar-7 CSV 
   1. Endpoint, clean video storage -> prefer _HQ.mkv
   2. verify SODxSN Matches
   3. Card events for Fouls*
   4. try to filter off_camera events
      1. by flag: working?
      2. by Events
   5. plot combinations events occurrences like conf matrix: 
      1. c_{i,j}  = count(i,j) in threshold
   6. fix most confused (matrix like), roc, etc
   7. plot samples BUGFIX
2. Calc H5 Size - possibly too big
3. Run Download script in GCP
   1. Split video per period
   2. Download from YT and Drive
4. AR with R2+1D/SlowFast
   1. Mmaction2 VideoDemo
   2. new VideoDataset using csv
   3. Multi-Label, Hierachical: Use BCEWithLogitsLoss or Sigmoid + **binary_crossentropy**
   4. MultiGrid?
5. Localization
   1. Multi-Label? -> ActivityNet Format for Localization
      1. no need for background -> (0,0,0,0,..., 0)
   2. DataSet given JSON and Videos -> sequential samples
      1. after video end, reset?
6. SoccerNet Evaluation

MISC: 

- gdrive id as externalId in CSV

