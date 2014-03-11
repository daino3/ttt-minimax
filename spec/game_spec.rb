describe Game do
  let(:player1) { Human.new(O_MARKER) }
  let(:player2) { Human.new(X_MARKER) }
  let(:board)   { Board.new(9) }
  let(:game)    { Game.new(player1, player2, board) }
 
  def stub_method(object, method, return_value)
    allow_any_instance_of(object).to receive(method.to_sym).and_return(return_value)
  end

  describe '#initialize' do
    it 'has a game_board, two players' do
      expect(game.board).to be_an(Board)
      expect(game.player1).to be_an(Human)
      expect(game.player2).to be_an(Human)
    end

    it 'sets the current_player to player1' do
      expect(game.current_player).to eq(player1)
    end
  end

  describe '#game_over?' do
    it 'returns false when the game is not over' do
      expect(game.send(:game_over?)).to be_false
    end

    it 'returns true when the game is over' do
      taken_spaces = [0,1,2,3,4,5,6,7,8]
      taken_spaces.each do |index|
        board.take_square(index, X_MARKER)
      end
      expect(game.send(:game_over?)).to be_true
    end
  end

  describe '#player_turn' do
    it 'calls move on the current player' do 
      stub_method(Console::BoardPrinter,'print_board', nil)
      stub_method(Console::Output, 'print_visual_break', nil)
      game.current_player.should_receive(:move).with(board)
      game.send(:player_turn)
    end
  end

  describe '#change_player' do
    it 'changes the current_player instance variable' do
      expect{game.send(:change_player)}.to change{game.current_player}.from(player1).to(player2)
    end
  end

  describe '#play_again?' do
    it 'creates a new game when the answer is yes' do
      stub_method(Console::Input, 'ask_to_play_again', 'yes')
      allow(game).to receive(:begin_new_game).and_return(nil)
      game.send(:play_again?)
    end

    it 'quits the program when the answer is no' do
      stub_method(Console::Input, 'ask_to_play_again', 'no')
      game.output.should_receive(:display_exit_message)
      game.send(:play_again?)
    end
  end
end
