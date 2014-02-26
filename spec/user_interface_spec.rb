require 'spec_helper'

describe UserInterface do
  let(:ui) {UserInterface.new}
  
  describe '#initialize' do
    it 'instantiates an instance of $stdin and $stdout' do
      expect(ui.input).to be_an(IO)
      expect(ui.output).to be_an(IO)
    end
  end

  describe '#determine_game_type' do
    it 'returns the user input when yes' do
      ui.input.stub(:gets) {"yes"}
      expect(ui.determine_game_type).to eq("yes")
    end

    it 'returns the user input when no' do
      ui.input.stub(:gets) {"no"}
      expect(ui.determine_game_type).to eq("no")
    end
  end

  describe '#display_first_player' do
    it 'logs a message with the player markers' do
      p1, p2 = Human.new(X_MARKER), Computer.new(O_MARKER)
      ui.output.should_receive(:puts).with("Player 1 is #{p1.class}(#{p1.marker}) and Player 2 is #{p2.class}(#{p2.marker})")
      ui.display_players(p1, p2)
    end
  end

  describe '#display_first_player' do
    it 'logs the marker of the player passed as an argument' do
      human = Human.new(X_MARKER)
      ui.output.should_receive(:puts).with("#{human.marker} is up first")
      ui.display_first_player(human)
    end
  end

  describe '#ask_to_play_again' do
    it 'returns the user input when yes' do
      ui.input.stub(:gets) {"yes"}
      expect(ui.ask_to_play_again).to eq('yes')
    end
  end

  describe '#display_exit_message' do
    it 'logs an exit message' do
      ui.output.should_receive(:puts).with("Thanks for playing, goodbye!!")
      ui.display_exit_message
    end
  end

  describe '#display_winner' do
    it 'logs the winning marker as winner' do
      ui.output.should_receive(:puts).with("#{X_MARKER} wins!!")
      ui.display_winner(X_MARKER)
    end
  end

  describe '#print_board' do
    it 'prints the board' do
      ## Not sure how to test this at this point
    end
  end

end