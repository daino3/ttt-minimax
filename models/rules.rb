class Rules
  attr_reader :game, :board

  def initialize(game_instance)
    @board = game_instance.board.boxes.dup
    @board_width = board_width
    @winning_positions  = [rows, columns, diagonals]
    binding.pry
  end

  # def is_gameover?
  #   return true if is_winner?
  #   return true if is_tie?
  #   return false
  # end

  # def is_winner?
  #   rows
  #   WINNING_POSITIONS.each do |group|
  #     x, y, z = group[0], group[1], group[2]
  #     if (@board[x] == @board[y]) && (@board[y] == @board[z]) && (@board[x] != EMPTY)
  #       @game.winner = @board[x]
  #       return true
  #     end
  #   end
  #   return false
  # end

  def board_width
    Math.sqrt(@board.length).to_i
  end

  def winning_combinations
    combos = [rows, columns, diagonals]
  end

  def rows
    map_board_to_indexes
    @board_width.times.map do |num|
      @board.slice(@board_width*num, @board_width)
    end
  end

  def columns
    rows.transpose
  end

  def diagonals
    diags = add_diagonal(@board_width -1, @board_width - 1) << add_diagonal(0, @board_width + 1)  
    diags.flatten!
    
    diagonals = 2.times.map do |num|
      diags.slice(board_width*num, board_width)
    end
  end

  def add_diagonal(starting_index, inc)
    diags = []
    @board_width.times do |num|
      diags << starting_index      
      starting_index += inc          
    end
    diags
  end                         

  def map_board_to_indexes
    @board.each_with_index do |box, index|
      @board[index] = index
    end
  end

  def is_tie?
    @board.all? do |box| 
      box != EMPTY 
    end
  end
end
