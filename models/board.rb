class Board
  attr_accessor :boxes 

  def initialize
    @boxes = [EMPTY]*9
  end

  def get_free_positions
    @boxes.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

end