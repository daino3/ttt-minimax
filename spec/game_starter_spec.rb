require 'spec_helper'

describe GameStarter do
  let(:starter) {GameStarter.new}

  describe '#initialize' do
    it 'is initialized with an instance of user interface marker' do
      expect(starter.ui).to be_an(UserInterface)
    end
  end

  describe '#start_computer_game' do
    it 'returns a game' do      
      expect(starter.send(:create_computer_game)).to be_an(Game)
    end

    it 'returns a game with a cpu and human player' do
      game = starter.send(:create_computer_game)
      expect(game.player1.instance_of?(Human) || game.player1.instance_of?(Computer)).to be_true      
    end
  end

  describe '#start_local_game' do
  
  end

end