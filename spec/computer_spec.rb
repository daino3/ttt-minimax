require 'rspec'
require 'pry'
require_relative '../models/game'
require_relative '../constants'
require_relative 'spec_helper'
require_relative '../models/human'

describe 'Computer' do
  let(:computer) {Computer.new(X_MARKER)}
  let(:game) {Game.new}

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(computer.marker).to eq(X_MARKER)      
      expect(computer.opponent).to eq(O_MARKER)
    end
  end

  describe '#get_score' do
    context 'when the computer wins' do
      it 'return a positive 1' do
        game.board[0] = game.board[1] = game.board[2] = X_MARKER
        game.is_winner?
        expect(computer.get_score(game)).to eq(1)
      end
    end

    context 'when the opponent wins' do
      it 'return a negative 1' do
        game.board[0] = game.board[1] = game.board[2] = O_MARKER
        game.is_winner?
        expect(computer.get_score(game)).to eq(-1)
      end
    end
  end

end
