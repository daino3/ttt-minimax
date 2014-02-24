class Rules

  def initialize(game_instance)
    @game  = game_instance
    @board = game_instance.board.boxes
  end

  def is_gameover?
    return true if is_winner?
    return true if is_tie?
    return false
  end

  def is_winner?
    WINNING_POSITIONS.each do |group|
      x, y, z = group[0], group[1], group[2]
      if (@board[x] == @board[y]) && (@board[y] == @board[z]) && (@board[x] != EMPTY)
        @game.winner = @board[x]
        return true
      end
    end
    return false
  end

  def is_tie?
    @board.all? do |box| 
      box != EMPTY 
    end
  end
end