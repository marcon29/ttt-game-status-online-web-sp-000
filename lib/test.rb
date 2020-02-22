# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# board = ["b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7", "b8"]
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
# board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
# board = ["O", "O", "O", " ", " ", " ", " ", " ", " "]
# board = [" ", " ", "O", " ", "O", " ", "O", " ", " "]
# board = ["X", "X", "O", "O", "X", "O", "X", "O", "X"]

# board = ["X", "O", "O", " ", " ", " ", " ", " ", " "]
board = ["X", "X", "O", "O", "O", "X", "X", "O", "X"]

# board = ["X", "X", "X", "O", "O", "O", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
	[0, 1, 2],   # row 1
	[3, 4, 5],   # row 2
	[6, 7, 8],   # row 3
	[0, 3, 6],   # column 1
	[1, 4, 7],   # column 2
	[2, 5, 8],   # column 3
	[0, 4, 8],   # diagnal 1
	[2, 4, 6]    # diagnal 2
]

# if win, returns array of winning board indices, if no win, returns empty array
def won?(board)
  result = WIN_COMBINATIONS.select do |win_combo|
    win_combo.all? { |win_index| board[win_index] == "X"} ||
    win_combo.all? { |win_index| board[win_index] == "O"}
  end
  result[0]
end

# returns true for all wins and false for anything else
def won_alt?(board)
  WIN_COMBINATIONS.any? do |win_combo|
    win_combo.all? { |win_index| board[win_index] == "X"} ||
    win_combo.all? { |win_index| board[win_index] == "O"}
  end
end

def full?(board)
  !(board.any? { |space| space == " " })
end

def draw?(board)
  full?(board) == true && won?(board) == nil
end

def over?(board)
  if full?(board) == true
    true
  elsif won?(board).class == Array
    true
  end
end

def winner(board)
  board[won?(board)[0]] == "X" #|| board[won?(board)[0]] == "O"
end

puts board.inspect
puts winner(board)
