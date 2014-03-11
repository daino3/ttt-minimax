module Strategy
  PlayerMove = Struct.new(:move, :score, :depth)

  class Minimax
    attr_reader :board, :cpu, :opponent

    def initialize(board, marker)
      @board    = board
      @cpu      = marker
      @opponent = @cpu == X_MARKER ? O_MARKER : X_MARKER
    end

    def get_best_move
      generate_moves(@cpu).move
    end

    def generate_moves(current_player, depth = 0)
      moves = []
      @board.get_free_positions.each do |index|
        @board.take_square(index, current_player)
        moves << player_move(current_player, index, depth)
        # sleep(1.0)
        # puts '======================================='
        # puts '======================================='
        # Console::BoardPrinter.new(@board).print_board
        # puts "Stack Level: #{depth}"
        # puts "Current Index: #{index}"
        # puts "Score: #{moves.last.score}"
        # puts "Winner: #{@board.winner if @board.winner}"
        # puts "Moves: #{moves}"
        revert_last_move
      end
      pick_best_move(moves, depth)
    end

    def player_move(current_payer, index, depth)
     if Rules.new(@board).is_gameover?
       PlayerMove.new(index, get_score, depth)
     else
       next_player = current_payer == @cpu ? @opponent : @cpu
       child = generate_moves(next_player, depth += 1)
       PlayerMove.new(index, child.score, child.depth)
     end
    end

    def pick_best_move(moves, depth)
      if depth.even? # or cpu turn at stack level
        # sort by max score and min depth
        moves.sort { |a, b| [b.score, a.depth] <=> [a.score, b.depth] }.first
      else
        # sort by min score and min depth
        moves.sort { |a, b| [a.score, a.depth] <=> [b.score, b.depth] }.first
      end
    end

    def revert_last_move
      last_move = @board.move_history.pop
      @board.boxes[last_move] = EMPTY
      @board.winner = false
    end

    def get_score
      return CPU_WINS if @board.winner == @cpu
      return OPPONENT_WINS if @board.winner == @opponent
      TIE_GAME
    end
  end

end
