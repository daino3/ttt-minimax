require 'spec_helper'

describe GameFactory do
  let(:factory) {GameFactory.new}

  describe '#initialize' do
    it 'is initialized with an instance of user interface marker' do
      expect(factory.ui).to be_an(UserInterface)
    end
  end

  describe '#start_computer_game' do
    it 'returns a game with a cpu and human player' do
      game = factory.start_computer_game
  expect().to be_an(Game)
    end
  end

  describe '#start_local_game' do
  
  end

end