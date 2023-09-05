 require_relative "./card.rb"
 
 class Board

    attr_reader :pairs

    def initialize(n)
        raise if n.odd?
        @grid = Array.new(n){Array.new(n)}
        @size = n * n 
        @pairs = []
        # @revealed = 0
    end

    def revealed
        flattened = @grid.flattened 
        flattened.count { |card| card.face_up == true }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def print
        @grid.each do |arr|
            p arr
        end
    end

    def populate
        make_pairs
        @pairs.each do |card|
            possible = true
            while possible
                row = rand(0...@grid.length)
                col = rand(0...@grid.length)
                if @grid[row][col] == nil
                    @grid[row][col] = card
                    possible = false
                end
            end
        end
    end

    def make_pairs
        num_pairs = @size / 2
        alpha = ("a".."z").to_a

        num_pairs.times do 
            x = alpha.sample
            2.times { @pairs << Card.new(x) }
        end
    end

    def cheat
        @grid.each do |row|
            array = []
            row.each do |card|
                array << card.face_value
            end
            p array.join(" ")
        end
    end

    def won?
        flattened = @grid.flatten
        flattened.all?{ |card| card.face_up == true }
    end

    def reveal(pos)
        self[pos].reveal
    end

    def render 
        @grid.each do |row|
            array = []
            row.each do |card|
                if card.face_up == true 
                    # p card.face_value
                    array << card.face_value
                else
                    array << "_"
                end
            end
            p array.join(" ")
        end
    end

end

# b = Board.new(4)
# b.make_pairs
# b.populate 
# b.print
# b.render
# b.cheat