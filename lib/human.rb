class Human
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def move(board)
    index = MoveValidator.new(board).get_index
    board.take_square(index, @marker)
  end

end
