class GameStarter
  attr_reader :ui

  def initialize
    @ui = UserInterface.new
  end

  def create_game
    user_response = @ui.determine_game_type
    user_response == "yes" ? create_computer_game : create_local_game
  end

  private

  def create_computer_game
    h, c = Human.new(X_MARKER), Computer.new(O_MARKER)
    p1, p2 = determine_first_player(h,c)
    @ui.cpu_game_start_message
    @ui.display_first_player(p1)
    @ui.print_visual_break
    Game.new(p1, p2)
  end

  def create_local_game # can't test this?
    h1, h2 = Human.new(X_MARKER), Human.new(O_MARKER)
    p1, p2 = determine_first_player(h1,h2)
    @ui.display_first_player(p1)
    @ui.print_visual_break
    Game.new(p1, p2)
  end

  def determine_first_player(p1, p2)
    i = rand(0..1)
    player1 = [p1, p2][i]
    player2 = [p1, p2][i == 0 ? 1 : 0]
    return player1, player2
  end

end