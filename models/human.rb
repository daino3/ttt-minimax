class Human
  attr_reader :marker

  def initialize(marker)
    @ui = UserInterface.new
    @marker = marker
  end

  def move(game_instance, index=nil) #can't test this because gets.chomp?
    while true
      index = @ui.ask_player_for_move
      break if valid_input?(index, game_instance)
      @ui.display_invalid_move
    end
    game_instance.take_square(@marker, index)
  end

  def valid_input?(index, game_instance)
    return true if game_instance.board.get_free_positions.include?(index) 
  end

end