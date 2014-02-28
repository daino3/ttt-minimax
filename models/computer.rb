class Computer
  attr_reader :marker, :opponent

  def initialize(marker)
    @marker   = marker
    @opponent = (@marker == X_MARKER) ? O_MARKER : X_MARKER
  end

  def move(game_instance) # should do something similar as with human_move bc we're passing around an instance of a game
    index = get_move(game_instance)
    game_instance.take_square(index)
  end

  def get_move(game_instance)
    return MIDDLE if game_instance.board.get_free_positions.include?(MIDDLE)
    move, score = max_move(game_instance)
    move
  end

  def take_square(game_instance, marker, index) # same method as game class
    game_instance.board.boxes[index] = marker
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
      take_square(game_instance, @marker, index) # take_square with computer marker

      if Rules.new(game_instance).is_gameover?
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
      take_square(game_instance, @opponent, index) # take_square with opponent marker
  
      if Rules.new(game_instance).is_gameover?
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
    return CPU_WINS if game_instance.winner == @marker 
    return PLAYER_WINS if game_instance.winner == @opponent
    return TIE_GAME
  end
end