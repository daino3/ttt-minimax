class MoveValidator
  attr_reader :game_instance, :input, :output
  
  def initialize(game_instance)
    @game_instance = game_instance
    @output        = UserInterface::Output.new
    @input         = UserInterface::Input.new    
  end

  def get_index
    while true
      index = @input.ask_player_for_move
      break if valid_input?(index)
      @output.display_invalid_move
    end
    return index
  end

  def valid_input?(index)
    return true if @game_instance.board.get_free_positions.include?(index) 
  end
end