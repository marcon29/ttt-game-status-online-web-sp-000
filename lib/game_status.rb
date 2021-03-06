# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
]

def won?(board)
  result = WIN_COMBINATIONS.select do |win_combo|
    win_combo.all? { |win_index| board[win_index] == "X"} ||
    win_combo.all? { |win_index| board[win_index] == "O"}
  end
  result[0]
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
  if won?(board).class == Array
    board[won?(board)[0]]
  end
end
