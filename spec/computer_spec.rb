describe Computer do
  let(:computer) { Computer.new(X_MARKER, IMPOSSIBLE) }
  let(:board)    { Board.new(9) }
  let(:rules)    { Rules.new(game) }

  describe '#initialize' do
    it 'is initialized with a marker' do
      expect(computer.marker).to eq(X_MARKER)      
    end
  end

  describe '#move' do
    context 'when given an index that\'s empty' do
      it 'marks the gameboard at said index' do
        allow_any_instance_of(Computer).to receive(:get_move).and_return(1)
        computer.move(board)
        expect(board.boxes[1]).to eq(X_MARKER)
      end
    end
  end

end
