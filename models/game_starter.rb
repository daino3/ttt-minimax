class GameStarter
  attr_reader :ui

  def initialize
    @ui = UserInterface.new
  end

  def create_game
    p1, p2 = create_players(@ui.determine_game_type)
    p1, p2 = determine_first_player(p1, p2)
    @ui.display_game_start_message(p1, p2)
    Game.new(p1, p2)
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