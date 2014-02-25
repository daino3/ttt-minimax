class Human
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def move(game_instance)
    HumanMove.new(game_instance, @marker).make_move
  end

end