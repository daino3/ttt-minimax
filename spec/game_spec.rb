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

  describe '#take_square' do
    it 'it claims a box on the board of an instance of a game' do
      game.take_square(0)
      expect(game.board.boxes[0] == game.current_player.marker).to be_true 
    end

    it 'shovels the last move into the last_moves array' do
      expect{game.take_square(1)}.to change{game.last_moves.length}.from(0).to(1) 
    end
  end

  describe '#change_player' do
    it 'changes the current_player instance variable' do
      expect{game.send(:change_player)}.to change{game.current_player}.from(player1).to(player2)
    end
  end
end