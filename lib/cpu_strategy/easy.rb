module Strategy
  class EasyCPU
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def get_index
      avail_moves = @board.get_free_positions
      avail_moves[rand(avail_moves.length-1)]
    end

  end
end
