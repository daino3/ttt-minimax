class Computer
  attr_reader :marker, :opponent

  def initialize(marker)
    @marker   = marker
    @opponent = (@marker == X_MARKER) ? O_MARKER : X_MARKER
  end

  def move(game_instance) # should do something similar as with human_move bc we're passing around an instance of a game
    move_position, score = max_move(game_instance)
    take_square(game_instance, @marker, move_position)
  end

  def take_square(game_instance, index)
    game_instance.board.boxes[index] = @marker
    game_instance.last_moves.push(index)
  end

  def revert_last_move(game_instance)
    last_index = game_instance.last_moves.pop
    game_instance.board.boxes[last_index] = '-'
    game_instance.winner = false
  end

  def max_move(game_instance)
    best_score = nil
    best_move  = nil

    empty_box_indices = game_instance.board.get_free_positions

    empty_box_indices.each do |index|
      game_instance.take_square(@marker, index) # take_square with computer marker

      if game_instance.game_over?
        score = get_score(game_instance)
      else
        move_position, score = min_move(game_instance) # call min_move
      end

      revert_last_move(game_instance)

      if best_score.nil? || score > best_score # change to > sign
        best_score = score
        best_move  = index
      end 
    end
    return best_move, best_score
  end

  def min_move(game_instance)
    best_score = nil
    best_move  = nil

    empty_box_indices = game_instance.board.get_free_positions

    empty_box_indices.each do |index|
      game_instance.take_square(@opponent, index) # take_square with opponent marker
  
      if game_instance.game_over?
        score = get_score(game_instance)
      else
        move_position, score = max_move(game_instance) # call max_move
      end
  
      revert_last_move(game_instance)
      
      if best_score.nil? || score < best_score # change to < sign
        best_score = score
        best_move  = index
      end
    end
    return best_move, best_score
  end

  def get_score(game_instance)
    if game_instance.winner == @marker 
      return CPU_WINS
    elsif game_instance.winner == @opponent
      return PLAYER_WINS
    end
    return TIE_GAME
  end
end
