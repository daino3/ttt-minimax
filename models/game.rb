class Game
  attr_accessor :winner, :last_moves, :board

  def initialize
    @ui     = UserInterface.new
    @board  = Board.new
    @last_moves = []
    @winner = nil
  end

  def take_square(marker, index)
    @board.boxes[index] = marker
    @last_moves.push(index) # put last index into last_moves array
  end

  def game_over?
    Rules.new(self).is_gameover?
  end

  def play(player1, player2)
    current_player = player1
    until game_over?
      next_player_turn(current_player)
      current_player = (current_player == player1) ? player2 : player1
    end
    @ui.display_game_recap(self)
    play_again?
  end

  def start_game # can't test this?
    user_response = @ui.determine_game_type
    user_response == "yes" ? GameFactory.new.start_computer_game : GameFactory.new.start_local_game
  end

  private

  def play_again? #can't test this?
    response = @ui.ask_to_play_again
    response == "yes" ? start_game : @ui.display_exit_message
  end

  def next_player_turn(player)
    @ui.print_board(@board)
    player.move(self)
    @ui.print_visual_break
  end

end