class UserInterface

  def initialize(input = $stdin, output = $stdout)
    @input  = input
    @output = output
  end

  ### USER MESSAGING

  def determine_game_type
    while true
      @output.puts("Would you like to play against the computer? (Yes or No)")
      response = @input.gets.chomp.downcase
      break if response == 'yes' || response == 'no'
    end
    return response
  end

  def cpu_game_start_message
    @output.puts("Player is #{X_MARKER} and the computer is #{O_MARKER}")
  end

  def display_first_player(p1)
    @output.puts("#{p1.marker} is up first")
  end

  def ask_to_play_again
    while true
      @output.puts('Would you like to play again? (Yes or No)')
      response = @input.gets.chomp.downcase
      break if response == 'yes' || response == 'no'
    end
    return response
  end

  def ask_player_for_move
    prompt; index = @input.gets.chomp.to_i
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

  def display_game_recap(game_instance)
    display_winner(game_instance.winner) if Rules.new(game_instance).is_winner?
    display_tie if Rules.new(game_instance).is_tie?
    print_board(game_instance.board)
  end

  ### BOARD

  def print_board(board)
    board_clone = board.boxes.dup
    numbered_board = number_board(board_clone)
    colored_board  = color_squares(numbered_board)
    3.times do |index|
      @output.print colored_board.slice(3*index, 3).join(' | '), "\n"
    end
  end

  def number_board(board)
    board.each_with_index { |box, index| board[index] = index if box == EMPTY }
  end

  def color_squares(board)
    board.map! do |box| 
      if box == O_MARKER
        box.bg_red
      elsif box == X_MARKER
        box.bg_green
      else
        box
      end
    end
  end

  # OTHER

  def print_visual_break
    @output.puts('----------------------')
  end

  def prompt
    print ">>"
  end

end