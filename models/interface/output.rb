module Console
  
  class Output
    attr_reader :output

    def initialize
      @output = $stdout
    end

    def display_game_recap(game_instance)
      display_winner(game_instance.winner) if Rules.new(game_instance).is_winner?
      display_tie if Rules.new(game_instance).is_tie?
      BoardPrinter.new(game_instance.board).print_board
    end

    def display_game_start_message(p1, p2) # tested each part of this independently
      display_players(p1, p2)
      display_first_player(p1)
      print_visual_break
    end

    def ask_for_difficulty
      @output.puts("Select your desired difficulty: easy(e) or impossible(i)")
    end

    def ask_for_board_size
      @output.puts("What size board would you like to play with: Standard (3x3) or Large (4x4)? (S or L)")
    end

    def ask_for_game_type
      @output.puts("Would you like to play against the computer? (Yes or No)")
    end

    def play_again_message
      @output.puts('Would you like to play again? (Yes or No)')
    end

    def display_players(p1, p2)
      @output.puts("Player 1 is #{p1.class}(#{p1.marker}) and Player 2 is #{p2.class}(#{p2.marker})")
    end

    def display_first_player(p1)
      @output.puts("#{p1.marker} is up first")
    end

    def display_exit_message
      @output.puts("Thanks for playing, goodbye!!")
    end

    def display_winner(winner)
      @output.puts("#{winner} wins!!")
    end

    def display_tie
      @output.puts("The Game is a tie")
    end

    def display_invalid_move
      @output.puts('Invalid move, please try again')
    end

    def print_visual_break
      @output.puts('----------------------')
    end

    def prompt
      @output.print ">>"
    end

  end

end
