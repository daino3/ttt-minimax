module UserInterface
  
  class Input
    attr_reader :input

    def initialize
      @input  = $stdin
      @output = Output.new
    end

    def determine_game_type
      while true
        @output.ask_for_game_type
        response = @input.gets.chomp.downcase
        break if response == 'yes' || response == 'no'
      end
      response
    end

    def ask_to_play_again
      while true
        @output.ask_to_play_again
        response = @input.gets.chomp.downcase
        break if response == 'yes' || response == 'no'
      end
      response
    end

    def ask_player_for_move
      @output.prompt; index = @input.gets.chomp.to_i
    end

  end

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

    def ask_for_game_type
      @output.puts("Would you like to play against the computer? (Yes or No)")
    end

    def ask_to_play_again
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

  class BoardPrinter
    attr_reader :boxes, :output
    
    def initialize(board)
      @boxes  = board.boxes.dup
      @output = $stdout
    end

    def print_board
      number_board
      color_squares
      3.times do |index|
        @output.print @boxes.slice(3*index, 3).join(' | '), "\n"
      end
    end

    private

    def number_board
      @boxes.each_with_index { |box, index| @boxes[index] = index if box == EMPTY }
    end

    def color_squares
      @boxes.map! do |box|
        case box 
          when O_MARKER; box.bg_red;
          when X_MARKER; box.bg_green;
          else; box;
        end
      end
    end
  
  end

end