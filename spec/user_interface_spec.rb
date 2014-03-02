require 'spec_helper'

describe UserInterface::Input do
  let(:input_ui) {UserInterface::Input.new}
  
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

describe UserInterface::Output do
  let(:output_ui) {UserInterface::Output.new}
  
  describe '#initialize' do
    it 'instantiates an instance of $stdout' do
      expect(output_ui.output).to be_an(IO)
    end
  end

  describe '#display_players' do
    it 'logs a message with the player markers' do
      p1, p2 = Human.new(X_MARKER), Computer.new(O_MARKER)
      output_ui.output.should_receive(:puts).with("Player 1 is #{p1.class}(#{p1.marker}) and Player 2 is #{p2.class}(#{p2.marker})")
      output_ui.display_players(p1, p2)
    end
  end

  describe '#display_first_player' do
    it 'logs the marker of the player passed as an argument' do
      human = Human.new(X_MARKER)
      output_ui.output.should_receive(:puts).with("#{human.marker} is up first")
      output_ui.display_first_player(human)
    end
  end

  describe '#display_exit_message' do
    it 'logs an exit message' do
      output_ui.output.should_receive(:puts).with("Thanks for playing, goodbye!!")
      output_ui.display_exit_message
    end
  end

  describe '#display_winner' do
    it 'logs the winning marker as winner' do
      output_ui.output.should_receive(:puts).with("#{X_MARKER} wins!!")
      output_ui.display_winner(X_MARKER)
    end
  end

  describe '#display_tie' do
    it 'logs the tie message' do
      output_ui.output.should_receive(:puts).with("The Game is a tie")
      output_ui.display_tie
    end
  end

  describe '#display_invalid_move' do
    it 'logs the message' do
      output_ui.output.should_receive(:puts).with('Invalid move, please try again')
      output_ui.display_invalid_move
    end
  end
end

describe UserInterface::BoardPrinter do
  let(:board)    {Board.new}
  let(:board_ui) {UserInterface::BoardPrinter.new(board)}

  describe '#print_board' do
    it 'is initialized with a board and turns it into its array of game boxes' do
      expect(board_ui.boxes).to be_an(Array)
    end
  end

end
