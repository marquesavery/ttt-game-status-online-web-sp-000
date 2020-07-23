# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? do |f|
    f.include?("X") || f.include?("O")
  end
end

def draw?(board)
  if full?(board) == true
    if won?(board) == false
      true
    end
  end
end

def over?(board)
  WIN_COMBINATIONS.any? do |w|
    if draw?(board) == true
      true
    elsif won?(board) == w
      true
    end
  end
end


def winner(board)
  WIN_COMBINATIONS.any? do |w|
    if won?(board) == w
      if w[0] == "X" && w[1] == "X" && w[2] == "X"
        return "X"
      elsif w[0] == "O" && w[1] == "O" && w[2] == "O"
        return "O"
      end
    end
  end
end
