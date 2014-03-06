class Rules
  attr_reader :game, :board

  def initialize(game_instance)
    @game        = game_instance
    @board       = game_instance.board.boxes.dup
    @board_dup   = @board.dup
    @board_width = board_width
    @winning_positions  = get_winning_positions
  end

  def is_gameover?
    return true if is_winner?
    return true if is_tie?
    return false
  end

  def is_winner?
    @winning_positions.each do |group|
      group.map! {|index| @board[index] } 
      if (group.all? {|e| e == group[0] }) && (group[0] != EMPTY)
        @game.winner = group[0]
        return true
      end
    end
    false
  end

  def is_tie?
    @board.all? do |box| 
      box != EMPTY 
    end
  end

  private

  def get_winning_positions
    map_board_to_indexes
    rows + columns + diagonals
  end

  def board_width
    Math.sqrt(@board.length).to_i
  end

  def rows
    @board_width.times.map do |num|
      @board_dup.slice(@board_width*num, @board_width)
    end
  end

  def columns
    rows.transpose
  end

  def diagonals
    diags = add_diagonal(@board_width -1, @board_width - 1) + add_diagonal(0, @board_width + 1)
    diags.flatten!

    diagonals = 2.times.map do |num|
      diags.slice(@board_width*num, @board_width)
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
    @board_dup.each_with_index do |box, index|
      @board_dup[index] = index
    end
  end

end
