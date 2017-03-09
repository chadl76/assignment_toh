require 'pry'
#method for generating tower hash
def render
#iterates through hash and 	
@towers.each do |tower_number, tower|
	puts "Tower #{tower_number}: #{tower}"
end
end

#initiliaze tower hash w/ key and value array
@towers = {1 => [], 2 => [], 3 => []}
#gets user input
puts "Select number of discs to start."
#puts user input into variable
discs = gets.chomp.to_i
#creates a copy of first key in tower hash 
@towers[1] = (1..discs).to_a
final = @towers[1].dup
#calls the render method
render
#creates loop to ask user for input
while true
#gets discs selection
puts "please select disc to move"
selection = gets.chomp.to_i
#gets tower selection
puts "please select tower to place disc"
destination = gets.chomp.to_i
#checks to make sure tower selection is the first element
if !@towers[selection].first 
	puts "invalid move"
else
#takes first element and 
selection = @towers[selection].shift
@towers[destination].push(selection)



end

render


if final == @towers[3]
	puts "win"
end
end

#remove selection from array which will be first element
#
#
#
#