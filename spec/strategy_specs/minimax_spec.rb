describe Strategy::Minimax do
  let(:board) { Board.new(9) }
  let(:mini)  { Strategy::Minimax.new(board, X_MARKER) } 

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(mini.board).to be_an(Board)
      expect(mini.cpu_marker).to eq(X_MARKER)
      expect(mini.opponent).to eq(O_MARKER)
    end
  end

  describe '#revert_last_move' do
    it 'pops off the last element in the last_moves array' do
      board.take_square(1, X_MARKER)
      expect{mini.revert_last_move}.to change{board.move_history.length}.from(1).to(0)
    end

    it 'changes the board element at the index to empty' do
      board.take_square(1, X_MARKER)
      mini.revert_last_move
      expect(board.boxes[1]).to eq(EMPTY) 
    end
  end

  describe '#get_score' do
    context 'when the computer wins' do
      it 'return a positive 1' do
        board.boxes[0] = board.boxes[1] = board.boxes[2] = X_MARKER
        Rules.new(board).is_winner?
        expect(mini.get_score).to eq(1)
      end
    end

    context 'when the opponent wins' do
      it 'return a negative 1' do
        board.boxes[0] = board.boxes[1] = board.boxes[2] = O_MARKER
        Rules.new(board).is_winner?
        expect(mini.get_score).to eq(-1)
      end
    end
  end

end
