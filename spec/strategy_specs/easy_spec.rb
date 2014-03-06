describe Strategy::EasyCPU do
  let(:cpu)   { Computer.new(X_MARKER) }
  let(:human) { Human.new(O_MARKER) }
  let(:board) { Board.new(9) }
  let(:game)  { Game.new(cpu, human, board) }
  let(:easy)  { Strategy::Minimax.new(game) } 

  describe '#initialize' do
    it 'is initialized with a marker and an oppenents marker' do
      expect(easy.game_instance).to be_an(Game)
      expect(easy.cpu_marker).to eq(cpu.marker)      
      expect(easy.opponent).to eq(human.marker)
    end
  end

end
