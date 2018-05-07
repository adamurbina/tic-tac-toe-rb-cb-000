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
    [2,4,6]
]

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        if (board[combo[0]] == board[combo[1]]) && (board[combo[1]] == board[combo[2]]) \
            && (board[combo[2]] != " " && board[combo[2]] != "")
            return combo
        end
    end
    false
end

def full?(board)
    board.each do |space|
        if space == " " || space == ""
            return false
        end
    end
    return true
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    full?(board) || won?(board)
end

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    else
        return "O"
    end
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
    board.count("X") + board.count("O")
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        puts "Please provide valid answer"
        turn(board)
    end
end

# Define your play method

def play(board)

    while !over?(board)
        turn(board)
        # if draw?(board)
        #     break
        # end
        break if draw?(board)
    end

    if won?(board)
        puts "Congratulations #{winner(board)}!"
    else
        puts "Cat's Game!"
    end
end
