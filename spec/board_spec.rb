describe Board do
  let(:board1) {Board.new(9)}
  let(:board2) {Board.new(16)}

  describe '#initialize' do
    it 'creates an array with desired number of elements' do
      expect(board1.boxes.length).to eq(9) 
      expect(board2.boxes.length).to eq(16) 
    end

    it 'creates an array with all EMPTY elements' do
      expect(board1.boxes.all? {|e| e == EMPTY}).to be_true 
    end

    it 'creates an array to chronicle the moves of the game' do
      expect(board1.move_history).to be_an(Array) 
    end

  end

  describe '#get_free_positions' do
    it 'returns an array with the indexes of empty boxes' do
      board1.boxes[0] = "Test"
      expect(board1.get_free_positions.include?(0)).to be_false 
    end
  end
  
  describe '#take_square' do
    it 'it claims a box on the board of an instance of a game' do
      board1.take_square(0, "H")
      expect(board1.boxes[0]).to eq("H") 
    end

    it 'shovels the last move into the last_moves array' do
      expect{board1.take_square(1, "H")}.to change{board1.move_history.length}.from(0).to(1) 
    end
  end

end
