require 'spec_helper'

describe Rules do
  let(:game)  {Game.new}
  let(:rules) {Rules.new(game)}

  describe '#initialize' do
    it 'is initialized with a game_instance' do
      expect(rules.game).to be_an(Game)      
      expect(rules.board).to be_an(Array)
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
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = "H"
        expect(rules.is_winner?).to be_true
      end

      it 'changes the winner variable' do
        game.board.boxes[0] = game.board.boxes[1] = game.board.boxes[2] = "H"
        expect{rules.is_winner?}.to change{game.winner}.from(nil).to("H")
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
      game.board.boxes[0] = "TEST"
      expect(rules.is_tie?).to be_false
    end

    it 'returns true if the board is full' do
      game.board.boxes.map! do |e|
        e ="TEST"
      end
      expect(rules.is_tie?).to be_true
    end
  end

end