class Computer
  attr_reader :marker, :opponent

  def initialize(marker)
    @marker   = marker
  end

  def move(game_instance) # should do something similar as with human_move bc we're passing around an instance of a game
    index = get_move(game_instance)
    game_instance.take_square(index)
  end

  def get_move(game_instance)
    return MIDDLE if game_instance.board.get_free_positions.include?(MIDDLE)
    move, score = Minimax.new(game_instance).max_move
    move
  end

end