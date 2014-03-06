describe MoveValidator do
  let(:player1)    { Human.new(O_MARKER) }
  let(:player2)    { Computer.new(X_MARKER) }
  let(:board)      { Board.new(9) }
  let(:validator)  { MoveValidator.new(board) }

  describe '#initialize' do
    it 'is initialized with a board and UX' do
      expect(validator.board).to be_an(Board)
      expect(validator.input).to be_an(Console::Input)
      expect(validator.output).to be_an(Console::Output)
    end
  end

  describe '#get_index' do
    it 'will return a valid index' do
      validator.input.stub(:ask_player_for_move)  {1}
      expect(validator.get_index).to eq(1)
    end

    it 'will return an error message if not given appropriate index' do
      # this one still difficult given circular nature of stubbing player_move
    end
  end

  describe '#valid_input?' do
    context 'when given an index that\'s empty' do
      it 'returns true' do
        expect(validator.valid_input?(2)).to be_true
      end
    end

    context 'when given an index that\'s not empty' do
      it 'notifies the user to give an empty index' do
        expect(validator.valid_input?(22)).to be_false
      end
    end
  end

end
