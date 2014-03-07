require 'pry'
require_relative 'config/constants'

WINNING_SCORE = 1
LOSING_SCORE = -1
TIE = 0
MIDDLE_SQUARE = 4
WINNING_POSITIONS = [[0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
$winner = nil

class Board
  attr_accessor :boxes, :last_moves

  def initialize(boxes = [EMPTY]*9)
    @boxes = boxes
    @last_moves = []
  end

  def get_free_positions
    @boxes.each_with_index.map do |box, index|
      index if box == EMPTY
    end.compact
  end

  def mark(index, player)
    @boxes[index] = player
    @last_moves << index
  end

  def print_board
    3.times do |index|
      print @boxes.slice(3*index, 3).join(' | '), "\n"
    end
  end

end

def minimax(player, board, counter = 0)
  moves = []
  board.get_free_positions.each do |move|
    board.mark(move, player)
    moves << player_move(player, move, board, counter)
    sleep(1.0)
    print "Stack Level: #{counter}) -----------------", board.boxes, "winner:#{$winner if $winner}", "\n"
    puts "I'm Here with #{moves}"
    puts "Current Index: #{move}"
    board.print_board
    revert_last_move(board)
    found_best_move?(moves[-1])
  end
  best_move(moves)
end

def revert_last_move(board)
  last_index = board.last_moves.pop
  board.boxes[last_index] = EMPTY
end

def player_move(player, move, board, counter)
  if is_gameover?(board)
    PlayerMove.new(move, score(player, board), 0)
  else
    child_move = minimax(opponent(player), board, counter+=1)
    PlayerMove.new(move, -child_move.score, child_move.depth += 1)
  end
end

def found_best_move?(move)
  move.score == WINNING_SCORE and move.depth == 0
end

def score(player, board)
  is_winner?(board)
  return WINNING_SCORE if $winner == player
  return LOSING_SCORE if $winner == opponent(player)
  return TIE if is_tie?(board)
end

def opponent(player)
  (player == X_MARKER) ? O_MARKER : X_MARKER
end

def best_move(moves)
  sorted_moves = moves.sort do |a, b|
    [a.score, a.depth] <=> [b.score, b.depth]
  end
  sorted_moves.max_by {|m| m.score}
end

def is_gameover?(board)
  return true if is_winner?(board)
  return true if is_tie?(board)
  return false
end

def is_winner?(board)
  WINNING_POSITIONS.each do |group|
    x, y, z = group[0], group[1], group[2]
    if (board.boxes[x] == board.boxes[y]) && (board.boxes[y] == board.boxes[z]) && (board.boxes[x] != EMPTY)
      $winner = board.boxes[x]
      return true
    end
  end
  false
end

def is_tie?(board)
  board.boxes.all? do |box|
    box != EMPTY 
  end
end

PlayerMove = Struct.new(:move, :score, :depth)

board  = Board.new
board.mark(0, X_MARKER)
board.mark(1, O_MARKER)
board.mark(2, X_MARKER)
board.mark(3, O_MARKER)
board.mark(4, X_MARKER)
board.mark(5, O_MARKER)
player   = X_MARKER
computer = O_MARKER

# current board - X_MARKER turn
# X | O | X
# O | X | O
# 6 | 7 | 8

puts minimax(player, board)
