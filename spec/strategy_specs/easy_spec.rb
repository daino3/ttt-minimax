describe Strategy::EasyCPU do
  let(:board) { Board.new(16) }
  let(:easy)  { Strategy::EasyCPU.new(board) } 

  describe '#initialize' do
    it 'is initialized with a board' do
      expect(easy.board).to be_an(Board) 
    end
  end

  describe '#get_index' do
    it 'returns a number within the range of available moves' do
      move_range = (0..(board.boxes.length - 1)).to_a
      expect(move_range.include?(easy.get_index)).to be_true
    end
  end

end
