require_relative "card"
require_relative "board"

class Game

    def initialize(n)
        @board = Board.new(n)
    end

    def guessed_pos
        pos = gets.chomp.split(" ")
        pos = pos.map{ |coordinate| coordinate.to_i }
        return pos
    end

    def play
        @board.render
        puts
        p 'Enter position of your next guess'
        puts
        pos = guessed_pos
    end

    def make_a_guess

    end

    def is_checking?
        return true if @board.revealed.odd?
        false
    end
end