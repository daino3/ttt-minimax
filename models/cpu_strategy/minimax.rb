module Strategy
  class Minimax
    attr_reader :board, :cpu_marker, :opponent

    def initialize(board, marker)
      @board      = board
      @cpu_marker = marker
      @opponent   = @cpu_marker == X_MARKER ? O_MARKER : X_MARKER
    end

    def max_move
      best_score = best_move = nil

      @board.get_free_positions.each do |index|
        @board.take_square(index, @cpu_marker)

        if Rules.new(@board).is_gameover?
          score = get_score
        else
          position, score = min_move
        end

        revert_last_move

        if best_score.nil? || score > best_score #FYI: change to > sign
          best_score = score
          best_move  = index
        end 
      end
      return best_move, best_score
    end

    def min_move
      best_score = best_move = nil

      @board.get_free_positions.each do |index|
        @board.take_square(index, @opponent)

        if Rules.new(@board).is_gameover?
          score = get_score
        else
          position, score = max_move
        end

        revert_last_move

        if best_score.nil? || score < best_score # FYI: change to < sign
          best_score = score
          best_move  = index
        end
      end
      return best_move, best_score
    end

    def revert_last_move
      last_index = @board.move_history.pop
      @board.boxes[last_index] = EMPTY
      @board.winner = false
    end

    def get_score
      return CPU_WINS if @board.winner == @cpu_marker
      return OPPONENT_WINS if @board.winner == @opponent
      return TIE_GAME
    end
  end
end
