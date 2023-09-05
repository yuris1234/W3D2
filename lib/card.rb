class Card
    # attr_reader :face_value

    def initialize
        @face_value
        @face_up? 
    end

    def display
        return @face_value if @face_up? == true
    end

    def hide 
        @face_up? = false
    end

    def reveal
        @face_up? = true 
    end

    def to_s

    end

    def ==()

    end

end