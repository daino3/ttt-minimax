class Game
  attr_accessor :winner, :last_moves, :board

  def initialize(player1, player2, board=Board.new)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @ui     = UserInterface.new
    @board  = board
    @last_moves = []
    @winner = nil
  end

  def play
    until game_over?
      player_turn
      change_player
    end
    @ui.display_game_recap(self)
    play_again?
  end

  def take_square(marker, index)
    @board.boxes[index] = marker
    @last_moves.push(index)
  end

  def game_over?
    Rules.new(self).is_gameover?
  end

  private

  def play_again? 
    response = @ui.ask_to_play_again
    response == "yes" ? GameStarter.new.create_game.play : @ui.display_exit_message
  end

  def player_turn
    @ui.print_board(@board)
    @current_player.move(self)
    @ui.print_visual_break
  end

  def change_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

end