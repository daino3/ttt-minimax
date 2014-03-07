module Strategy
  FinishedGame = Struct.new(:move, :score, :depth)

  class Minimax
    attr_reader :board, :cpu, :opponent, :index

    def initialize(board, marker)
      @board    = board
      @cpu      = marker
      @opponent = @cpu == X_MARKER ? O_MARKER : X_MARKER
      @index    = minimax(@cpu).move
    end

    def minimax(current_player, depth = 0)
      completed_games = []

      @board.get_free_positions.each do |index|
        @board.take_square(index, current_player)
        completed_games << player_move(current_player, index, depth)
        revert_last_move
      end
      best_move(completed_games)
    end

    def player_move(current_payer, index, depth)
     if Rules.new(@board).is_gameover?
       FinishedGame.new(index, get_score, depth)
     else
       next_player = current_payer == @cpu ? @opponent : @cpu
       sub_move    = minimax(next_player, depth += 1)
       FinishedGame.new(index, -sub_move.score, sub_move.depth)
     end
    end

    def best_move(finished_games)
      sorted_games = finished_games.sort do |a, b|
        [a.score, a.depth] <=> [b.score, b.depth]
      end
      sorted_games.max_by {|m| m.score}
    end

    def revert_last_move
      last_index = @board.move_history.pop
      @board.boxes[last_index] = EMPTY
      @board.winner = false
    end

    def get_score
      return CPU_WINS if @board.winner == @cpu
      return OPPONENT_WINS if @board.winner == @opponent
      TIE_GAME
    end
  end

end
