require 'spec_helper'

describe GameStarter do
  let(:starter) {GameStarter.new}

  describe '#initialize' do
    it 'is initialized with an instance of Input and Output' do
      expect(starter.input).to be_an(Console::Input)
      expect(starter.output).to be_an(Console::Output)
    end
  end

  describe '#create_board' do
    context 'when given S' do
      it 'returns a 3x3 board' do
        allow_any_instance_of(Console::Input).to receive(:get_board_size).and_return('S')
        expect(create_board(starter.input.get_board_size).board.boxes.length).to eq(9)
      end
    end

    context 'when given L' do
      it 'returns a 4x4 board' do
        allow_any_instance_of(Console::Input).to receive(:get_board_size).and_return('L')
        expect(create_board(starter.input.get_board_size).board.boxes.length).to eq(16)
      end
    end
  end

  describe '#create_computer_game' do
    it 'returns a game with a computer player given yes' do
      allow_any_instance_of(Console::Input).to receive(:get_board_size).and_return("S")

      allow_any_instance_of(Console::Input).to receive(:determine_game_type).and_return("yes")
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player1.instance_of?(Computer)).to be_true      
    end

    it 'returns a game with 2 human players given no' do
      allow_any_instance_of(Console::Input).to receive(:get_board_size).and_return("S")

      allow_any_instance_of(Console::Input).to receive(:determine_game_type).and_return("no")
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player2.instance_of?(Human)).to be_true      
    end
  end

end