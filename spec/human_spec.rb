require 'spec_helper'

describe Human do
  let(:human)     {Human.new(X_MARKER)}
  let(:computer)  {Computer.new(O_MARKER)}
  let(:game)      {Game.new(human, computer)}

  describe '#initialize' do
    it 'is initialized with a marker' do
      expect(human.marker).to eq(X_MARKER)
    end
  end

  describe '#move' do
    context 'when given an index that\'s empty' do
      it 'marks the gameboard at said index' do
        allow_any_instance_of(HumanMove).to receive(:get_index).and_return(1)
        human.move(game)
        expect(game.board.boxes[1]).to eq(X_MARKER)
      end
    end
  end
end