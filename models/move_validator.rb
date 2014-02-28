class MoveValidator
  attr_reader :game_instance, :ui
  
  def initialize(game_instance)
    @game_instance = game_instance
    @ui            = UserInterface.new
  end

  def get_index
    while true
      index = @ui.ask_player_for_move
      break if valid_input?(index)
      @ui.display_invalid_move
    end
    return index
  end

  def valid_input?(index)
    return true if @game_instance.board.get_free_positions.include?(index) 
  end
end