describe Game do
  let(:player1) { Human.new(O_MARKER) }
  let(:player2) { Human.new(X_MARKER) }
  let(:board)   { Board.new(9) }
  let(:game)    { Game.new(player1, player2, board) }
  
  describe '#initialize' do
    it 'has a game_board, and two players' do
      expect(game.board).to be_an(Board)
      expect(game.player1).to be_an(Human)
      expect(game.player2).to be_an(Human)
    end

  end

  describe '#change_player' do
    it 'changes the current_player instance variable' do
      expect{game.send(:change_player)}.to change{game.current_player}.from(player1).to(player2)
    end
  end
end
