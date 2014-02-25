require 'spec_helper'

describe Game do
  let(:game) {Game.new}
  
  describe '#initialize' do
    it 'creates a game_board' do
      expect(game.board).to be_an(Board) 
    end

    it 'creates an array to chronicle the moves of the game' do
      expect(game.last_moves).to be_an(Array) 
    end

    it 'creates a winner variable which is set to nil' do
      expect(game.winner).to be_nil
    end
  end

  describe '#take_square' do
    it 'returns an array with the indexes of empty boxes' do
      game.take_square("TEST",0)
      expect(game.board.boxes[0] == "TEST").to be_true 
    end

    it 'shovels the last move into the last_moves array' do
      expect{game.take_square("TEST",0)}.to change{game.last_moves.length}.from(0).to(1) 
    end
  end

end