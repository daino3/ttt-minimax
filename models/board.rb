class Board
  attr_accessor :boxes 

  def initialize(size)
    @boxes = [EMPTY]*size
  end

  def get_free_positions
    @boxes.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

end
