require 'pry' 

class TicTacToe
    attr_accessor :board
    def initialize()
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8]
]    

def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "------------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(player_input)
    player_input.to_i - 1
end


def move(index, token = X)
    @board[index] = token
end


def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
end

def turn_count
    counter = 0
    @board.each do |x|
        if x == ("X") || x == ("O")
            counter += 1
        end
    end
    return counter
end

def current_player
    turn_count % 2 == 0? "X" : "O"
end


def turn
    puts "Choose a spot between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
end

def won?
    WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(combo[0])
    end
end


def full?
    turn_count == 9
end


def draw?
    !won? && full?
end


def over?
    won? || full? || draw?
end


def winner
    won = ""
    if winner = won?
        won = @board[winner.first]
    end
end


def play
    until over?
        turn
    end

    if won?
        winner = winner()
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
end
end