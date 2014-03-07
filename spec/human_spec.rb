describe Human do
  let(:human)     {Human.new(X_MARKER)}
  let(:board)     {Board.new(9)}

  describe '#initialize' do
    it 'is initialized with a marker' do
      expect(human.marker).to eq(X_MARKER)
    end
  end

  describe '#move' do
    context 'when given an index that\'s empty' do
      it 'marks the gameboard at said index' do
        allow_any_instance_of(MoveValidator).to receive(:get_index).and_return(1)
        human.move(board)
        expect(board.boxes[1]).to eq(X_MARKER)
      end
    end
  end
end
