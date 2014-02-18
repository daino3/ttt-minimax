### TIC TAC TOE - MINIMAX

Author: Dain Hall

### Overview:
This is a command line application. A user can play locally or against the Computer. To run the application run:
```
ruby play.rb
```
To run test suite:
```
rspec all_spec.rb
```

### Solution Overview:
There are 3 classes: Game, Human, Computer. The Game class houses almost all of the logic in regards to the board, winning combinations and communication to the user. The Human class is lean and has methods only related to getting input from the user via the command line. The Computer class has all the minimax magic. 