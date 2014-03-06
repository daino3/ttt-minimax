class MoveValidator
  attr_reader :board, :input, :output
  
  def initialize(board)
    @board  = board
    @output = Console::Output.new
    @input  = Console::Input.new
  end

  def get_index
    while true
      index = @input.ask_player_for_move
      break if valid_input?(index)
      @output.display_invalid_move
    end
    index
  end

  def valid_input?(index)
    @board.get_free_positions.include?(index) 
  end
end
