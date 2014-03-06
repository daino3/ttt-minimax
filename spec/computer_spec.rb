describe Computer do
  let(:player1)  { Human.new(O_MARKER) }
  let(:computer) { Computer.new(X_MARKER) }
  let(:board)    { Board.new(9) }
  let(:game)     { Game.new(computer, player1, board) }
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
        computer.move(game)
        expect(game.board.boxes[1]).to eq(X_MARKER)
      end
    end
  end

end
