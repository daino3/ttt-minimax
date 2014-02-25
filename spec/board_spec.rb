require 'spec_helper'

describe Board do
  let(:board) {Board.new}
  
  describe '#initialize' do
    it 'creates an array with 9 EMPTY elements' do
      expect(board.boxes.length).to eq(9) 
      expect(board.boxes.all? {|e| e == EMPTY}).to be_true 
    end
  end

  describe '#get_free_positions' do
    it 'returns an array with the indexes of empty boxes' do
      board.boxes[0] = "Test"
      expect(board.get_free_positions.include?(0)).to be_false 
    end
  end
  
end