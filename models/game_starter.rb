class GameStarter
  attr_reader :input, :output

  def initialize
    @output = Console::Output.new
    @input  = Console::Input.new
  end

  def create_game
    b_size = @input.get_board_size
    board  = create_board(b_size)

    g_type = @input.determine_game_type
    diff   = @input.get_difficulty if g_type == CPU_GAME

    p1, p2 = create_players(g_type, diff)
    p1, p2 = determine_first_player(p1, p2)
    @output.display_game_start_message(p1, p2)
    Game.new(p1, p2, board)
  end

  def create_board(type)
    size = (type == STANDARD) ? 9 : 16
    Board.new(size)
  end

  private

  def create_players(game_type, difficulty)
    return Human.new(X_MARKER), game_type == CPU_GAME ? Computer.new(O_MARKER, difficulty) : Human.new(O_MARKER)
  end

  def determine_first_player(p1, p2)
    i = rand(0..1)
    player1 = [p1, p2][i]
    player2 = [p1, p2][i == 0 ? 1 : 0]
    return player1, player2
  end

end
