class Game
  attr_accessor :board, :player1, :player2, :current_player
  attr_reader :input, :output

  def initialize(player1, player2, board, interface=Console)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board   = board
    @ux      = interface
    @input   = @ux::Input.new
    @output  = @ux::Output.new
  end

  def play # how do I test this?
    until game_over?
      player_turn
      change_player
    end
    @output.display_game_recap(@board)
    play_again?
  end

  private

  def change_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    Rules.new(@board).is_gameover?
  end

  def play_again? 
    response = @input.ask_to_play_again
    response == "yes" ? begin_new_game : @output.display_exit_message
  end

  def begin_new_game
    GameStarter.new.create_game.play
  end

  def player_turn
    print_board
    @current_player.move(@board)
    @output.print_visual_break
  end

  def print_board
    @ux::BoardPrinter.new(@board).print_board
  end
end
