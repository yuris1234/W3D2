require_relative "./game.rb"


print 'Enter a size for memory game (even number)'
puts 
size = gets.chomp.to_i

g = Game.new(size)

until g.win?
    g.play
end
