require 'spec_helper'

describe 'Human' do
  let(:human) {Human.new("Hello")}
  let(:game) {Game.new}

  describe '#initialize' do
    it 'is initialized with a marker' do
      expect(human.marker).to eq("Hello")
    end
  end

  describe '#valid_input?' do
    context 'when given an index that\'s empty' do
      it 'returns true' do
        expect(human.send(:valid_input?, 2, game)).to be_true
      end
    end

    context 'when given an index that\'s not empty' do
      it 'notifies the user to give an empty index' do
        out = capture_stdout do
          human.send(:valid_input?, 22, game)
        end
        out.string.should include("Invalid move")
      end
    end
  end

  describe '#move' do
    context 'when given an index that\'s empty' do
      it 'marks the gameboard at said index' do
        human.stub(:gets) { "1\n" }
        human.move(game)
        expect(game.board[1]).to eq("Hello")
      end
    end
  end
end