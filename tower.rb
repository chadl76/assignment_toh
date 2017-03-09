class Tower
	attr_accessor :height
	
	#sets up three empty tower arrays
	def initialize(height)
		@height = height
		@towers = [[], [], []]
    #populates first tower with height
		(1..height).each do |n|
		  @towers[0] << n
	  end
	end
  
  #render method shows towers
	def render
		@towers.each_with_index do |row, index|
			puts "#{row} Tower: #{index + 1}"
    end
	end
  
  #method to run game loop
	def play
		loop do
			#calls method to render towers
			render
			#calls method to get coordinates
			get_coordinates
      #calls method to place selections
			place_move
      #calls method to check if game is over breaks loop if game over
      if game_over?
			break
      end
		end
	end
  
  #method to get user input
	def get_user_input
		puts "What tower would you like to select disc from"
		puts "and what tower would you like to put disc in?"
		puts "(ex 1,3)"
		#gets input and stips comma and maps to integers
		gets.strip.split(",").map(&:to_i)
	end
	
	#method to get coordinates
  def get_coordinates
    #places user input into variable
  	coordinates = get_user_input
  	#tower to place disc
  	@to = coordinates[0]
  	#tower to get disc from
  	@from = coordinates[1]
  end
  
  #method to place disc into tower
  def place_move 
  	#makes sure larger disc cant be placed on top of smaller disc
  	if @towers[@to].any? && @towers[@to].last < @towers[@from].last
  		puts "Cant place a bigger disc on top of smaller one"
  	else
  	#pushes tower from into tower destination
  	@towers[@to] << @towers[@from].shift
    end
  end
  
  #method to check if towers equal final tower
  def game_over?
  	if @towers[0] == @final_tower
  		puts "You won!"
  	end
  end
end
#instatiate a new Tower class
game = Tower.new(3)
#runs game
game.play