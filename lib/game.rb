class Game
  attr_accessor :board, :player1, :player2, :current_player

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @board   = board
    @input   = Console::Input.new
    @output  = Console::Output.new
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
    response == "yes" ? GameStarter.new.create_game.play : @output.display_exit_message
  end

  def player_turn
    Console::BoardPrinter.new(@board).print_board
    @current_player.move(@board)
    @output.print_visual_break
  end

end
