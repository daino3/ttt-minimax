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
The application is broken into 8 main ideas: the board, players (human and CPU), the game, game creation, move validation, rules, CPU strategy and the interfaces(just console for now). The Game class houses the logic to request moves from players and play until the game is deemed over. The GameStarter creates Game objects by asking the user for the appropriate players, difficulty and board size. The Human class is lean and has methods only related to getting input from the user via the command line. The Computer class has a difficulty setting and marker. The difficulty setting stored as an instance variable in the Computer class is responsible for instantiating strategies for each of the computer's move. Strategies are currently easy and impossible (minimax).
