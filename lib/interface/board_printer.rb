module Console
  class BoardPrinter
    attr_reader :boxes, :output

    def initialize(board)
      @boxes  = board.boxes.dup
      @width  = Math.sqrt(@boxes.length).to_i
      @output = $stdout
    end

    def print_board
      number_board
      color_squares
      @width.times do |index|
        row = @boxes.slice(@width*index, @width)
        @output.puts row.join(' | ')
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
