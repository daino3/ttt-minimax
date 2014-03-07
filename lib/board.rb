class Board
  attr_accessor :boxes, :move_history, :winner

  def initialize(size)
    @boxes = [EMPTY]*size
    @move_history = []
    @winner = nil
  end

  def get_free_positions
    @boxes.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

  def take_square(index, marker)
    @boxes[index] = marker
    @move_history.push(index)
  end

end
