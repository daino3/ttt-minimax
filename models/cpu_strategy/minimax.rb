class Minimax
  attr_reader :game_instance, :cpu_marker, :opponent

  def initialize(game_instance)
    @game_instance = game_instance
    @cpu_marker    = game_instance.current_player.marker
    @opponent      = @cpu_marker == X_MARKER ? O_MARKER : X_MARKER
  end

  def max_move
    best_score = best_move = nil

    free_positions.each do |index|
      take_square(@cpu_marker, index) # take_square with computer marker

      if Rules.new(@game_instance).is_gameover?
        score = get_score
      else
        move_position, score = min_move # call min_move
      end

      revert_last_move

      if best_score.nil? || score > best_score # change to > sign
        best_score = score
        best_move  = index
      end 
    end
    return best_move, best_score
  end

  def min_move
    best_score = best_move = nil

    free_positions.each do |index|
      take_square(@opponent, index) # take_square with opponent marker
  
      if Rules.new(@game_instance).is_gameover?
        score = get_score
      else
        move_position, score = max_move # call max_move
      end
  
      revert_last_move
      
      if best_score.nil? || score < best_score # change to < sign
        best_score = score
        best_move  = index
      end
    end
    return best_move, best_score
  end

  def free_positions
    @game_instance.board.get_free_positions
  end

  def take_square(marker, index) # same method as game class
    @game_instance.board.boxes[index] = marker
    @game_instance.last_moves.push(index)
  end

  def revert_last_move
    last_index = @game_instance.last_moves.pop
    @game_instance.board.boxes[last_index] = EMPTY
    @game_instance.winner = false
  end

  def get_score
    return CPU_WINS if @game_instance.winner == @cpu_marker
    return PLAYER_WINS if @game_instance.winner == @opponent
    return TIE_GAME
  end
end