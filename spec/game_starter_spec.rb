require 'spec_helper'

describe GameStarter do
  let(:starter) {GameStarter.new}

  describe '#initialize' do
    it 'is initialized with an instance of user interface marker' do
      expect(starter.ui).to be_an(UserInterface)
    end
  end

  describe '#start_computer_game' do
    it 'returns a game with a computer player given yes' do
      allow_any_instance_of(UserInterface).to receive(:determine_game_type).and_return("yes")
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player1.instance_of?(Computer)).to be_true      
    end

    it 'returns a game with 2 human players given no' do
      allow_any_instance_of(UserInterface).to receive(:determine_game_type).and_return("no")
      test_game = starter.create_game
      expect(test_game.player1.instance_of?(Human) || test_game.player2.instance_of?(Human)).to be_true      
    end
  end

end