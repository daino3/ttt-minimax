class Rules
  attr_reader :game, :board

  def initialize(game_instance)
    @game  = game_instance
    @board = game_instance.board.boxes.dup
    @rows  = rows
    @columns = columns
    @diagonals = diagonals
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

  # (3x3)
  # ROWS    = [0,1,2], [3,4,5], [6,7,8] 
  # COLUMNS = [0,3,6], [1,4,7], [2,5,8] 
  # DIAGS   = [0,4,8], [2,4,6]

  # (4x4)
  # ROWS    = [0,1,2,3] , [4,5,6,7],  [8,9,10,11], [12,13,14,15] 
  # COLUMNS = [0,4,8,12], [1,5,9,13], [2,6,7,14] , [3,7,11,15]
  # DIAGS   = [0,4,8], [2,4,6]

  def board_width
    Math.sqrt(@board.length).to_i
  end

  def winning_combinations
    combos = [rows, columns, diagonals]
  end

  def rows
    map_board_to_indexes
    board_width.times.map do |num|
      @board.slice(board_width*num, board_width)
    end
  end

  def columns
    rows.transpose
  end

  def diagonals
    diags = []
    inc   = board_width - 1
    index_num = inc
    board_width.times do |num|
      diags << index_num
      index_num += inc
    end

    inc = board_width + 1
    index_num = 0
    board_width.times do |num|
      diags << index_num
      index_num += inc
      binding.pry
    end
diagonals = 2.times do |num|
  diags.slice(board_width*num, board_width)
end

      binding.pry
  end

  def map_board_to_indexes
    @board.each_with_index do |box, index|
      @board[index] = index
    end
  end

  # def is_tie?
  #   @board.all? do |box| 
  #     box != EMPTY 
  #   end
  # end
end
