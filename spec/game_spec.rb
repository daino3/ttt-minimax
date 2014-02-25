require 'spec_helper'

describe Game do
  let(:player1) { Human.new(O_MARKER) }
  let(:player2) { Human.new(X_MARKER) }
  let(:game)    { Game.new(player1, player2) }
  
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

end