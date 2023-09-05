require_relative "card"
require_relative "board"

class Game

    def initialize(n)
        @board = Board.new(n)
        @board.populate
    end

    def guessed_pos
        p 'Enter position of your next guess'
        puts
        pos = gets.chomp.split(" ")
        pos = pos.map{ |coordinate| coordinate.to_i }
        return pos
    end

    def play
        @board.populate
        @board.render
        puts

        pos1 = guessed_pos

        make_a_guess(pos1)

        pos2 = guessed_pos

        make_a_guess(pos2)

        if @board[pos1].face_value != @board[pos2].face_value
            @board[pos1].hide 
            @board[pos2].hide
        end

    end

    def make_a_guess(pos)
        @board.reveal(pos)
        @board.render
        puts
    end

    def win?
        @board.revealed == @board.size
    end
end