class Computer
  attr_reader :marker, :opponent

  def initialize(marker)
    @marker   = marker
  end

  def move(game_instance)
    index = get_move(game_instance)
    game_instance.take_square(index)
  end

  def get_move(game_instance)
    avail_moves = game_instance.board.get_free_positions

    if game_instance.difficulty == IMPOSSIBLE
      return MIDDLE if avail_moves.include?(MIDDLE)
      move, score = Strategy::Minimax.new(game_instance).max_move
      return move
    elsif game_instance.difficulty == EASY
      return Strategy::EasyCPU.new(game_instance).get_index
    end
  end

end
