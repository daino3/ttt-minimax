describe Strategy::Minimax do
  let(:board) { Board.new(9) }
  let(:mini)  { Strategy::Minimax.new(board, X_MARKER) } 

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(mini.board).to be_an(Board)
      expect(mini.cpu).to eq(X_MARKER)
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

  describe '#generate_moves' do
    context 'when given a board' do
      it 'returns the best possible move' do
        # X | O | X
        # O | X | O
        # - | - | -
        
        # board = Board.new(9)
        # x_moves = [0,2,4]
        # o_moves = [1,3,5]
        # x_moves.each {|i| board.boxes[i] = X_MARKER} # assume X is computer
        # o_moves.each {|i| board.boxes[i] = O_MARKER} # assume O is player
        # game = Strategy::Minimax.new(board, X_MARKER).generate_games(X_MARKER)
        # expect(game).to be_an(Strategy::FinishedGame)
        # expect(game.move).to eq(6)
      end

       it 'returns the best possible move' do
        #  X | O | O
        #  - | O | X
        #  - | X | -

         board = Board.new(9)
         x_moves = [0,5,7]
         o_moves = [1,2,4]
         x_moves.each {|i| board.boxes[i] = X_MARKER} # assume X is computer
         o_moves.each {|i| board.boxes[i] = O_MARKER} # assume O is player
         
         move_struct = Strategy::Minimax.new(board, X_MARKER).generate_moves(X_MARKER)
         expect(move_struct.move).to eq(6)
       end

       it 'will win if given the opportunity' do
        #  X | O | -
        #  - | O | -
        #  - | - | X

         board = Board.new(9)
         x_moves = [0,8]
         o_moves = [1,4]
         x_moves.each {|i| board.boxes[i] = X_MARKER} # assume X is computer
         o_moves.each {|i| board.boxes[i] = O_MARKER} # assume O is player
         
         move_struct = Strategy::Minimax.new(board, X_MARKER).generate_moves(X_MARKER)
         expect(move_struct.move).to eq(7)
       end
    end
  end

  describe '#pick_best_move' do
    context 'when even depth (cpu turn)' do
      it 'sorts moves by max score and min depth' do
        move1 = Strategy::PlayerMove.new(6, 1, 3)
        move2 = Strategy::PlayerMove.new(8, 0, 1)
        move3 = Strategy::PlayerMove.new(7, 1, 7)
        move4 = Strategy::PlayerMove.new(1, -1, 4)
        move5 = Strategy::PlayerMove.new(1, 0, 4)
        unsorted_moves = [move1, move2, move3, move4, move5]
        expect(mini.pick_best_move(unsorted_moves, 0)).to eq(move1)
      end
    end

    context 'when given an odd depth (player turn)' do
      it 'sorts moves by min score and min depth' do
        move1 = Strategy::PlayerMove.new(6, 1, 3)
        move2 = Strategy::PlayerMove.new(8, 0, 1)
        move3 = Strategy::PlayerMove.new(7, 1, 7)
        move4 = Strategy::PlayerMove.new(1, -1, 4)
        move5 = Strategy::PlayerMove.new(1, -1, 5)
        unsorted_moves = [move1, move2, move3, move4, move5]
        expect(mini.pick_best_move(unsorted_moves, 1)).to eq(move4)
      end
    end 
  end
end
