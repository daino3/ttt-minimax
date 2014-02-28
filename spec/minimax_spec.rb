require 'spec_helper'

describe Minimax do
  let(:cpu)   { Computer.new(X_MARKER) }
  let(:human) { Human.new(O_MARKER) }
  let(:game)  { Game.new(cpu, human) }
  let(:mini)  { Minimax.new(game) } 

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(mini.game_instance).to be_an(Game)
      expect(mini.cpu_marker).to eq(cpu.marker)      
      expect(mini.opponent).to eq(human.marker)
    end
  end

  describe '#revert_last_move' do
    it 'pops off the last element in the last_moves array' do
      allow_any_instance_of(MoveValidator).to receive(:get_index).and_return(1)
      human.move(game)
      expect{mini.revert_last_move}.to change{game.last_moves.length}.from(1).to(0)
    end

    it 'changes the board element at the index to empty' do
      allow_any_instance_of(MoveValidator).to receive(:get_index).and_return(1)
      human.move(game)
      mini.revert_last_move
      expect(game.board.boxes[1]).to eq(EMPTY) 
    end
  end

  describe '#get_score' do
    context 'when the computer wins' do
      it 'return a positive 1' do
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = X_MARKER
        Rules.new(game).is_winner?
        expect(mini.get_score).to eq(1)
      end
    end

    context 'when the opponent wins' do
      it 'return a negative 1' do
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = O_MARKER
        Rules.new(game).is_winner?
        expect(mini.get_score).to eq(-1)
      end
    end
  end

end