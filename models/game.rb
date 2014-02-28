class Game
  attr_accessor :winner, :last_moves, :board, :player1, :player2, :current_player, :score, :moves

  def initialize(player1, player2, board=Board.new)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @ui     = UserInterface.new
    @board  = board
    @last_moves = []
    @winner = nil
  end

  def play # how do I test this?
    until game_over?
      player_turn
      change_player
    end
    @ui.display_game_recap(self)
    play_again?
  end

  def take_square(index)
    @board.boxes[index] = @current_player.marker
    @last_moves.push(index)
  end

  def change_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  private

  def game_over?
    Rules.new(self).is_gameover?
  end

  def play_again? 
    response = @ui.ask_to_play_again
    response == "yes" ? GameStarter.new.create_game.play : @ui.display_exit_message
  end

  def player_turn
    @ui.print_board(@board)
    @current_player.move(self)
    @ui.print_visual_break
  end

end