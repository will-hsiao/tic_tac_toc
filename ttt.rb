	#---------Scenario--------------------
	# 1. draw the grid
	# 2. get player's position
	#		2.1 draw player's position on the grid
	#	3. check if player wins
	#	4. get computer's position
	#		4.1 draw computer's position on the grid
	#	5. check if computer wins)

require 'pry'

def draw_grid(arr)
	arr.each_with_index do |choice, i|
		p "#{choice}  "+ "|"
		binding.pry
		p "--------------\n" if i == 2 || i  ==5
	end
end

grid=[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
draw_grid(grid)

begin
	puts "Input your move (1..9)"
	player_input=gets.chomp
	player_choice=player_input.to_i

end while grid[player_choice] == ' '

grid[player_choice]= 'O'
draw_grid(grid)






