module Console
  
  class BoardPrinter
    attr_reader :boxes, :output
    
    def initialize(board)
      @boxes       = board.boxes.dup
      @board_width = Math.sqrt(@boxes.length).to_i
      @output = $stdout
    end

    def print_board
      number_board
      color_squares
      @board_width.times do |index|
        @output.print @boxes.slice(@board_width*index, @board_width).join(' | '), "\n"
      end
    end

    private

    def number_board
      @boxes.each_with_index { |box, index| @boxes[index] = index if box == EMPTY }
    end

    def color_squares
      @boxes.map! do |box|
        case box 
          when O_MARKER; box.bg_red;
          when X_MARKER; box.bg_green;
          else; box;
        end
      end
    end
  
  end

end
