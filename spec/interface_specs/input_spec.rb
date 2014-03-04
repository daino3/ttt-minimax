require 'spec_helper'

describe Console::Input do
  let(:input_ui) {Console::Input.new}
  let(:output_ui) {Console::Output.new}
  
  describe '#initialize' do
    it 'instantiates an instance of $stdin' do
      expect(input_ui.input).to be_an(IO)
    end
  end

  describe '#ask_to_play_again' do
    it 'returns the user input when yes' do
      input_ui.input.stub(:gets) {"yes"}
      expect(input_ui.ask_to_play_again).to eq('yes')
    end

    it 'returns the user input when no' do
      input_ui.input.stub(:gets) {"no"}
      expect(input_ui.ask_to_play_again).to eq('no')
    end
  end

  describe '#get_board_size' do
    context 'when given Standard (S) or Large (L)' do
      it 'it returns the input' do
        input_ui.input.stub(:gets) {"S"}        
        expect(input_ui.get_board_size).to eq("s")
        input_ui.input.stub(:gets) {"L"}        
        expect(input_ui.get_board_size).to eq("l")
      end
    end
  end

  describe '#determine_game_type' do
    it 'returns the user input when yes' do
      input_ui.input.stub(:gets) {"yes"}
      expect(input_ui.determine_game_type).to eq("yes")
    end

    it 'returns the user input when no' do
      input_ui.input.stub(:gets) {"no"}
      expect(input_ui.determine_game_type).to eq("no")
    end
  end
end