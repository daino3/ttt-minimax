module Console
  
  class Input
    attr_reader :input

    def initialize
      @input  = $stdin
      @output = Output.new
    end

    def determine_game_type
      while true
        @output.ask_for_game_type
        response = @input.gets.chomp.downcase
        break if response == 'yes' || response == 'no'
      end
      response
    end

    def get_board_size
      while true
        @output.ask_for_board_size
        response = @input.gets.chomp.downcase
        break if response == 's' || response == 'l'
      end
      response
    end

    def ask_to_play_again
      while true
        @output.ask_to_play_again
        response = @input.gets.chomp.downcase
        break if response == 'yes' || response == 'no'
      end
      response
    end

    def ask_player_for_move
      @output.prompt; index = @input.gets.chomp.to_i
    end

  end
end