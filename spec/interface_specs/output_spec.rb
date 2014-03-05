require 'spec_helper'

describe Console::Output do
  let(:output_ui) {Console::Output.new}
  
  describe '#initialize' do
    it 'instantiates an instance of $stdout' do
      expect(output_ui.output).to be_an(IO)
    end
  end

  def stub_message(message)
    output_ui.output.should_receive(:puts).with(message)
  end

  describe '#display_players' do
    it 'logs a message with the player markers' do
      p1, p2 = Human.new(X_MARKER), Computer.new(O_MARKER)
      stub_message("Player 1 is #{p1.class}(#{p1.marker}) and Player 2 is #{p2.class}(#{p2.marker})")
      output_ui.display_players(p1, p2)
    end
  end

  describe '#display_first_player' do
    it 'logs the marker of the player passed as an argument' do
      human = Human.new(X_MARKER)
      stub_message("#{human.marker} is up first")
      output_ui.display_first_player(human)
    end
  end

  describe '#display_exit_message' do
    it 'logs an exit message' do
      stub_message("Thanks for playing, goodbye!!")
      output_ui.display_exit_message
    end
  end

  describe '#display_winner' do
    it 'logs the winning marker as winner' do
      stub_message("#{X_MARKER} wins!!")
      output_ui.display_winner(X_MARKER)
    end
  end

  describe '#display_tie' do
    it 'logs the tie message' do
      stub_message("The Game is a tie")
      output_ui.display_tie
    end
  end

  describe '#display_invalid_move' do
    it 'logs the message' do
      stub_message('Invalid move, please try again')
      output_ui.display_invalid_move
    end
  end

  describe '#ask_for_board_size' do
    it 'asks the user to give them the desired board size' do
      stub_message('What size board would you like to play with: Standard (3x3) or Large (4x4)? (S or L)')
      output_ui.ask_for_board_size
    end
  end
end
