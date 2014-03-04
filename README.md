### TIC TAC TOE - MINIMAX

Author: Dain Hall

### Overview:
This is a command line application. A user can play locally or against the Computer. To run the application run:
```
ruby play.rb
```
To run test suite:
```
rspec
```

### Solution Overview:
There are 8 classes: Board, Computer, Game, GameStarter, Human, MoveValidator, Rules and Console. The Game class houses the logic to request moves from players and play through the game. The GameStarter creates Game objects by asking the user for the appropriate players. The Human class is lean and has methods only related to getting input from the user via the command line. The Computer class has all the minimax magic which needs to be refactored into its own class - this is a doozy. 
