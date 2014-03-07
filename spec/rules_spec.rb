describe Rules do
  let(:player1) {Human.new(X_MARKER)}
  let(:board)   {Board.new(9)}
  let(:rules)   {Rules.new(board)}

  describe '#initialize' do
    it 'is initialized with a board' do
      expect(rules.board).to be_an(Board)
    end

    it 'is finds the board width' do
      expect(rules.board_width).to eq(3)
    end
  end

  describe '#is_gameover?' do
    it 'returns false if there is no winner or tie' do
      expect(rules.is_gameover?).to be_false
    end
  end

  describe '#is_winner?' do
    context 'when there IS A winner..' do
      it 'returns true' do
        rules.boxes[0] = rules.boxes[1] = rules.boxes[2] = "H"
        expect(rules.is_winner?).to be_true
      end

      it 'changes the winner variable' do
        rules.boxes[0] = rules.boxes[3] = rules.boxes[6] = "H"
        expect{rules.is_winner?}.to change{board.winner}.from(nil).to("H")
      end
    end
 
    context 'when there is NO winner' do
      it 'returns false' do
        expect(rules.is_winner?).to be_false
      end
    end
  end

  describe '#is_tie?' do
    it 'returns false if there are empty spaces on the board' do
      rules.boxes[0] = "TEST"
      expect(rules.is_tie?).to be_false
    end

    it 'returns true if the board is full' do
      rules.boxes.map! do |e|
        e ="TEST"
      end
      expect(rules.is_tie?).to be_true
    end
  end

end
