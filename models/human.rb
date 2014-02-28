class Human
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def move(game_instance)
    index = MoveValidator.new(game_instance).get_index
    game_instance.take_square(index)
  end

end