class Computer
  attr_reader :marker, :difficulty

  def initialize(marker, difficulty)
    @marker     = marker
    @difficulty = difficulty
  end

  def move(board)
    index = get_move(board)
    board.take_square(index, @marker)
  end

  def get_move(board)
    avail_moves = board.get_free_positions

    if @difficulty == IMPOSSIBLE
      return MIDDLE if avail_moves.include?(MIDDLE)
      Strategy::Minimax.new(board, @marker).index
    elsif @difficulty == EASY
      Strategy::EasyCPU.new(board).get_index
    end
  end

end
