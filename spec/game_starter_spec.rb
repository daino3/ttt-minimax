describe GameStarter do
  let(:starter) {GameStarter.new}

  before(:each) do
    allow_any_instance_of(Console::Output).to receive(:display_game_start_message).and_return(nil)
  end

  def stub_input(method, return_value)
    allow_any_instance_of(Console::Input).to receive(method.to_sym).and_return(return_value)
  end

  describe '#initialize' do
    it 'is initialized with an instance of Input and Output' do
      expect(starter.input).to be_an(Console::Input)
      expect(starter.output).to be_an(Console::Output)
    end
  end

  describe '#create_board' do
    context 'when given S' do
      it 'returns a 3x3 board' do
        expect(starter.create_board('s').boxes.length).to eq(9)
      end
    end

    context 'when given L' do
      it 'returns a 4x4 board' do
        expect(starter.create_board('l').boxes.length).to eq(16)
      end
    end
  end

  describe '#create_computer_game' do
    it 'returns a game with a computer player given yes' do
      stub_input('get_board_size', 's')
      stub_input('get_difficulty', 'e')
      stub_input('determine_game_type', 'yes')
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player1.instance_of?(Computer)).to be_true
    end

    it 'returns a game with 2 human players given no' do
      stub_input('get_board_size', 's')
      stub_input('get_difficulty', 'e')
      stub_input('determine_game_type', 'no')
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player2.instance_of?(Human)).to be_true
    end
  end

end
