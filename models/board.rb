class Board
  attr_accessor :boxes, :move_history

  def initialize(size)
    @boxes = [EMPTY]*size
    @move_history = []
  end

  def get_free_positions
    @boxes.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

end
