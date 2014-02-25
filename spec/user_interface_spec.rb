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
    it 'returns the user input when yes or no' do

    end
  end  
end