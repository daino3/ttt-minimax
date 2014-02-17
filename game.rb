require_relative 'constants'
require_relative 'human'
require_relative 'computer'

class Game
  attr_accessor :board 
  attr_reader :winner, :last_moves, :winning_positions

  def initialize
    @board = [EMPTY]*9
    @last_moves = []
    @winning_positions = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8], [2,4,6]]
    @winner = nil
  end

  def print_board # can't test this?
    3.times do |index|
      print @board.slice(3*index, 3).join(' | '), "\n"
    end
  end

  def get_free_positions
    @board.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

  def take_square(marker, index)
    @board[index] = marker
    @last_moves.push(index) # put last index into last_moves array
  end

  def revert_last_move
    @board[@last_moves.pop] = '-'
    @winner = false
  end

  def is_gameover?
    return true if is_winner?
    return true if is_tie?
    return false
  end

  def is_winner?
    @winning_positions.each do |group|
      x, y, z = group[0], group[1], group[2]
      if (@board[x] == @board[y]) && (@board[y] == @board[z]) && (@board[x] != EMPTY)
        @winner = @board[x]
        return true
      end
    end
    return false
  end

  def is_tie?
    @board.all? do |box| 
      box != EMPTY 
    end
  end

  def play(player1, player2)
    p1 = player1
    p2 = player2

    until is_gameover?
      break if next_player_turn(p1)
      break if next_player_turn(p2)
    end
    play_again?
  end

  def start_game # can't test this?
    input = ''
    while true
      puts "Would you like to play against the computer? (Yes or No)"
      input = gets.chomp.downcase
      break if input == 'yes' || input == 'no'
    end

    input == "yes" ? start_computer_game : start_local_game
  end

  private

  def next_player_turn(player)
    print_board
    player.move(self)
    return check_game_state
  end

  def start_computer_game #can't test this?
    p1, p2 = Human.new(X_MARKER), Computer.new(O_MARKER)
    index_of_p1  = rand(0..1)
    first_player = [p1, p2][index_of_p1]
    sec_player   = [p1, p2][index_of_p1 == 0 ? 1 : 0]
    puts "Player is #{X_MARKER} and the computer is #{O_MARKER}"
    puts "#{first_player.marker} is up first"
    Game.new.play(first_player, sec_player)
  end

  def start_local_game #can't test this?
    p1, p2 = Human.new(X_MARKER), Human.new(O_MARKER)
    index_of_p1  = rand(0..1)
    first_player = [p1, p2][index_of_p1]
    sec_player   = [p1, p2][index_of_p1 == 0 ? 1 : 0]
    puts "#{first_player.marker} is up first"
    Game.new.play(first_player, sec_player)
  end

  def play_again? #can't test this?
    while true
      puts 'Would you like to play again? (Yes or No)'
      input = gets.chomp.downcase
      if input == "yes"
        start_game
      elsif input == "no"
        puts "Thanks for playing, goodbye!!"
        break
      end
    end
  end

  def check_game_state 
    if is_winner?
      puts "#{@winner} wins!!" 
      return true
    elsif is_tie?
      puts "The Game is a tie" if is_tie?
      return true
    end
    false
  end

end