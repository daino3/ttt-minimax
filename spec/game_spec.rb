require 'rspec'
require_relative '../models/game'
require_relative '../constants'
require_relative 'spec_helper'
require_relative '../models/human'

describe 'Game' do
  let(:game) {Game.new}
  
  describe '#initialize' do
    it 'creates a game_board with 9 empty boxes' do
      expect(game.board).to be_an(Array) 
      expect(game.board.length).to eq(9) 
      expect(game.board.all? {|e| e == EMPTY}).to be_true 
    end

    it 'creates an array to chronicle the moves of the game' do
      expect(game.last_moves).to be_an(Array) 
    end

    it 'creates a winner variable which is set to nil' do
      expect(game.winner).to be_nil
    end

    it 'creates an array of all winning combinations' do
      expect(game.winning_positions.all? {|group| group.length == 3}).to be_true
    end
  end

  describe '#get_free_positions' do
    it 'returns an array with the indexes of empty boxes' do
      game.board[0] = "Test"
      expect(game.get_free_positions.include?(0)).to be_false 
    end
  end

  describe '#take_square' do
    it 'returns an array with the indexes of empty boxes' do
      game.take_square("TEST",0)
      expect(game.board[0] == "TEST").to be_true 
    end

    it 'shovels the last move into the last_moves array' do
      expect{game.take_square("TEST",0)}.to change{game.last_moves.length}.from(0).to(1) 
    end
  end

  describe '#revert_last_move' do
    it 'pops off the last element in the last_moves array' do
      game.take_square("TEST",0)
      expect{game.revert_last_move}.to change{game.last_moves.length}.from(1).to(0)
    end

    it 'changes the board element at the index to empty' do
      game.take_square("TEST",0)
      game.revert_last_move
      expect(game.board[0]).to eq(EMPTY) 
    end
  end

  describe '#is_winner?' do
    context 'when there IS A winner..' do
      it 'returns true' do
        game.board[0] = game.board[1] = game.board[2] = "H"
        expect(game.is_winner?).to be_true
      end

      it 'changes the winner variable' do
        game.board[0] = game.board[1] = game.board[2] = "H"
        expect{game.is_winner?}.to change{game.winner}.from(nil).to("H")
      end
    end
 
    context 'when there is NO winner' do
      it 'returns false' do
        expect(game.is_winner?).to be_false
      end
    end

  end

  describe '#is_tie?' do
    it 'returns false if there are empty spaces on the board' do
      game.board[0] = "TEST"
      expect(game.is_tie?).to be_false
    end

    it 'returns true if the board is full' do
      game.board.map! do |e|
        e ="TEST"
      end
      expect(game.is_tie?).to be_true
    end
  end

end