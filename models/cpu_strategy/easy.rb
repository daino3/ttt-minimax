module Strategy
  class EasyCPU
    attr_reader :game_instance, :cpu_marker, :opponent

    def initialize(game_instance)
      @game_instance = game_instance
    end

    def get_index
      free_positions[rand(free_positions.length-1)]
    end

    def free_positions
      @game_instance.board.get_free_positions
    end

  end
end
