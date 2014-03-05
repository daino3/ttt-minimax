require 'spec_helper'

describe Console::Input do
  let(:input_ui) {Console::Input.new}
  let(:output_ui) {Console::Output.new}

  def test_response(method, result)
    expect(input_ui.send(method.to_sym)).to eq(result)
  end

  describe '#initialize' do
    it 'instantiates an instance of $stdin' do
      expect(input_ui.input).to be_an(IO)
    end
  end

  describe '#ask_to_play_again' do
    it 'returns the user input when yes' do
      input_ui.input.stub(:gets) {"yes"}
      test_response('ask_to_play_again', 'yes')
    end

    it 'returns the user input when no' do
      input_ui.input.stub(:gets) {"no"}
      test_response("ask_to_play_again", 'no')
    end
  end

  describe '#get_board_size' do
    context 'when given Standard (S) or Large (L)' do
      it 'it returns the input' do
        input_ui.input.stub(:gets) {"S"}
        test_response('get_board_size', 's')
        input_ui.input.stub(:gets) {"L"}
        test_response('get_board_size', 'l')
      end
    end
  end

  describe '#determine_game_type' do
    it 'returns the user input when yes' do
      input_ui.input.stub(:gets) {"yes"}
      test_response('determine_game_type', 'yes')
    end

    it 'returns the user input when no' do
      input_ui.input.stub(:gets) {"no"}
      test_response('determine_game_type', 'no')
    end
  end
end
