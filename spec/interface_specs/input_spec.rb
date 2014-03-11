describe Console::Input do
  let(:input_ui)  { Console::Input.new }
  let(:output_ui) { Console::Output.new }

  def test_response(method, result)
    expect(input_ui.send(method)).to eq(result)
  end

  def stub_output(method, return_value)
    allow_any_instance_of(Console::Output).to receive(method.to_sym).and_return(nil)
  end

  describe '#initialize' do
    it 'instantiates an instance of $stdin' do
      expect(input_ui.input).to be_an(IO)
    end
  end

  describe '#ask_to_play_again' do
    it 'returns the user input when yes' do
      input_ui.input.stub(:gets) {"yes"}
      stub_output(:play_again_message, nil)
      test_response('ask_to_play_again', 'yes')
    end

    it 'returns the user input when no' do
      input_ui.input.stub(:gets) {"no"}
      stub_output(:play_again_message, nil)
      test_response("ask_to_play_again", 'no')
    end
  end

  describe '#get_board_size' do
    context 'when given Standard (S) or Large (L)' do
      it 'it returns the input' do
        stub_output(:ask_for_board_size, nil)
        input_ui.input.stub(:gets) {"S"}
        test_response('get_board_size', 's')
        input_ui.input.stub(:gets) {"L"}
        test_response('get_board_size', 'l')
      end
    end
  end

  describe '#determine_game_type' do
    it 'returns the user input when cpu' do
      stub_output(:ask_for_game_type, nil)
      input_ui.input.stub(:gets) {"cpu"}
      test_response('determine_game_type', CPU_GAME)
    end

    it 'returns the user input when local' do
      stub_output(:ask_for_game_type, nil)
      input_ui.input.stub(:gets) {"local"}
      test_response('determine_game_type', LOCAL_GAME)
    end
  end
end
