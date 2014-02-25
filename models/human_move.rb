class HumanMove
  attr_reader :game_instance, :marker, :ui
  
  def initialize(game_instance, player)
    @game_instance = game_instance
    @marker = player.marker
    @ui = UserInterface.new
  end

  def make_move
    take_square(get_index)
  end

  def take_square(index)
    @game_instance.board.boxes[index] = @marker
    @game_instance.last_moves.push(index)
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