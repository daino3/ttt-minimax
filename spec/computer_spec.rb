require 'spec_helper'

describe Computer do
  let(:player1)  { Human.new(O_MARKER) }
  let(:computer) { Computer.new(X_MARKER) }
  let(:game)     { Game.new(player1, computer) }
  let(:rules)    { Rules.new(game) }

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(computer.marker).to eq(X_MARKER)      
      expect(computer.opponent).to eq(O_MARKER)
    end
  end

  describe '#revert_last_move' do
    it 'pops off the last element in the last_moves array' do
      allow_any_instance_of(HumanMove).to receive(:get_index).and_return(1)
      player1.move(game)
      expect{computer.revert_last_move(game)}.to change{game.last_moves.length}.from(1).to(0)
    end

    it 'changes the board element at the index to empty' do
      allow_any_instance_of(HumanMove).to receive(:get_index).and_return(1)
      player1.move(game)
      computer.revert_last_move(game)
      expect(game.board.boxes[1]).to eq(EMPTY) 
    end
  end

  describe '#get_score' do
    context 'when the computer wins' do
      it 'return a positive 1' do
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = X_MARKER
        rules.is_winner?
        expect(computer.get_score(game)).to eq(1)
      end
    end

    context 'when the opponent wins' do
      it 'return a negative 1' do
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = O_MARKER
        rules.is_winner?
        expect(computer.get_score(game)).to eq(-1)
      end
    end
  end

  describe '#take_square' do
    it 'it claims a box on the board of an instance of a game' do
      computer.take_square(game, 0)
      expect(game.board.boxes[0] == computer.marker).to be_true 
    end

    it 'shovels the last move into the last_moves array' do
      expect{computer.take_square(game, 0)}.to change{game.last_moves.length}.from(0).to(1) 
    end
  end

end
