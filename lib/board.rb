 class Board

    def initialize(n)
        @grid = Array.new(n){Array.new(n)}
        @size = n * n 
        @pairs = []
    end

    def print
        @grid.each do |arr|
            puts arr
        end
    end

    def populate
    end

    def make_pairs
        num_pairs = @size / 2
        alpha = "a".."z".to_a

        num_pairs.times do 
            x = alpha.sample
            2.times { @pairs << Card.new(x) }
        end
    end



end