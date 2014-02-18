require_relative 'game'

class Human
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def prompt
    print ">>"
  end

  def move(game_instance) #can't test this because gets.chomp?
    while true
      prompt; index = gets.chomp.to_i
      break if valid_input?(index, game_instance)
    end
    game_instance.take_square(@marker, index)
  end

  def valid_input?(index, game_instance)
    if game_instance.get_free_positions.include?(index)
      return true
    else
      puts 'Invalid move, please try again'
    end
  end
end