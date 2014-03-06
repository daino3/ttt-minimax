describe Console::BoardPrinter do
  let(:board)    {Board.new(9)}
  let(:board_ui) {Console::BoardPrinter.new(board)}

  describe '#print_board' do
    it 'is initialized with a board and turns it into its array of game boxes' do
      expect(board_ui.boxes).to be_an(Array)
    end
  end

end
