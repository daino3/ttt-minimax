require 'spec_helper'

describe HumanMove do
  let(:game) {Game.new}
  let(:human_move) {HumanMove.new(game, "Hello")}

  describe '#initialize' do
    it 'is initialized with a game_instance, marker' do
      expect(human_move.game_instance).to be_an(Game)
      expect(human_move.marker).to eq("Hello")
    end

    it 'instantiates a user_interface' do
      expect(human_move.ui).to be_an(UserInterface)      
    end
  end

  describe '#make_move' do
    context 'when given an index that\'s empty' do
      it 'marks the gameboard at said index' do
        human_move.stub(:get_index) { 1 }
        human_move.make_move
        expect(game.board.boxes[1]).to eq("Hello")
      end
    end
  end

  describe '#get_index' do
    it 'will return a valid index' do
      human_move.ui.stub(:ask_player_for_move)  {1}
      expect(human_move.get_index).to eq(1)
    end

    it 'will return an error message if not given appropriate index' do
      # this one still difficult given circular nature of stubbing player_move
    end
  end

  describe '#valid_input?' do
    context 'when given an index that\'s empty' do
      it 'returns true' do
        expect(human_move.valid_input?(2)).to be_true
      end
    end

    context 'when given an index that\'s not empty' do
      it 'notifies the user to give an empty index' do
        expect(human_move.valid_input?(22)).to be_false
      end
    end
  end

end