
class EasyCP 
  attr_reader :game_instance, :cpu_marker, :opponent

  def initialize(game_instance)
    @game_instance = game_instance
    @cpu_marker    = game_instance.current_player.marker
  end

  def free_positions
    @game_instance.board.get_free_positions
  end

  def get_index
    free_positions[rand(0..free_positions.length)]
  end

  def take_square(marker, index) # same method as game class
    @game_instance.board.boxes[index] = marker
    @game_instance.last_moves.push(index)
  end

end
