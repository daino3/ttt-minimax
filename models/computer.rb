require 'pry'
require_relative 'game'

class Computer
  attr_reader :marker, :opponent

  def initialize(marker)
    @marker   = marker
    @opponent = @marker == X_MARKER ? O_MARKER : X_MARKER
  end

  def move(game_instance)
    move_position, score = max_move(game_instance)
    game_instance.take_square(@marker, move_position)
  end

  def max_move(game_instance)
    best_score = nil
    best_move  = nil

    empty_box_indices = game_instance.get_free_positions

    empty_box_indices.each do |index|
      game_instance.take_square(@marker, index) # take_square with computer marker

      if game_instance.is_gameover?
        score = get_score(game_instance)
      else
        move_position, score = min_move(game_instance) # call min_move
      end

      game_instance.revert_last_move

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

    empty_box_indices = game_instance.get_free_positions

    empty_box_indices.each do |index|
      game_instance.take_square(@opponent, index) # take_square with opponent marker
  
      if game_instance.is_gameover?
        score = get_score(game_instance)
      else
        move_position, score = max_move(game_instance) # call max_move
      end
  
      game_instance.revert_last_move
      
      if best_score.nil? || score < best_score # change to < sign
        best_score = score
        best_move  = index
      end
    end
    return best_move, best_score
  end

  def get_score(game_instance)
    if game_instance.winner == @marker 
      return 1 # computer wins
    elsif game_instance.winner == @opponent
      return -1 # player wins
    end
    return 0 # game is draw
  end
end
