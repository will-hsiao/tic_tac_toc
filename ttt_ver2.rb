	#---------Scenario--------------------
	# 1. draw the grid
	# 2. get player's position
	#		2.1 draw player's position on the grid
	#	3. check if player wins
	#	4. get computer's position
	#		4.1 draw computer's position on the grid
	#	5. check if computer wins)

#require 'pry'

#Draw  Grid with Choices
def draw_grid(arr)
	puts "\e[H\e[2J" #Clean Screen
	arr.each_with_index do |choice, i|
		print choice
		print  "|"  if ((i+1)%3) != 0
		print "\n---------\n" if i == 2 || i  ==5 || i==8
	end
end

  
def arbitrate(arr, icon)
  win_pattern=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  win_pattern.each do |w|
    if (arr[w[0]]==icon) && (arr[w[1]]==icon) && (arr[w[2]]==icon)
      return TRUE # icon wins!
    end
  end
  return FALSE
end

def choice_at_empty?(arr, choice)
  return TRUE if choice<0 && choice >8
  return (arr[choice]==" ")?  TRUE : FALSE
end

def grid_full?(arr)
  a=arr.select {|b| b==" "}
  return (a.length == 0)? TRUE : FALSE
end

#Initialize Grid
grid=[' ',' ',' ',' ',' ',' ',' ',' ',' ']
draw_grid(grid)

loop do #Game begin

  #Player Choice
  begin
	puts "Input your move (0..8)"
	player_input=gets.chomp
	player_choice=player_input.to_i
	puts "yours: #{player_choice}"
  end while  !choice_at_empty?(grid, player_choice)

  grid[player_choice]= 'O'
  draw_grid(grid)
  if arbitrate(grid, 'O')
    puts "You won!" 
    break
  end
  if grid_full?(grid)
    puts "Grid Full!"
    break
  end


  #Computer Choice
  begin
	computer_choice=rand(8)
	p computer_choice.to_s
  end while (grid[computer_choice] =='O'  || grid[computer_choice] =='X') 
  grid[computer_choice] = 'X'
  draw_grid(grid)
    if arbitrate(grid, 'X')
    puts "Computer won!" 
    break
  end

    if grid_full?(grid)
    puts "Grid Full!"
    break
  end

end



