class GameStarter
  attr_reader :input, :output

  def initialize
    @output = Console::Output.new
    @input  = Console::Input.new
  end

  def create_game
    board  = create_board(@input.get_board_size)
    game_type = @input.determine_game_type
    diff   = @input.get_difficulty if game_type == "yes"
    p1, p2 = create_players(game_type)
    p1, p2 = determine_first_player(p1, p2)
    @output.display_game_start_message(p1, p2)
    Game.new(p1, p2, board, diff)
  end

  def create_board(response)
    size = (response == 's') ? 9 : 16 
    Board.new(size)
  end

  private

  def create_players(response)
    return Human.new(X_MARKER), response == "yes" ? Computer.new(O_MARKER) : Human.new(O_MARKER)
  end

  def determine_first_player(p1, p2)
    i = rand(0..1)
    player1 = [p1, p2][i]
    player2 = [p1, p2][i == 0 ? 1 : 0]
    return player1, player2
  end

end
