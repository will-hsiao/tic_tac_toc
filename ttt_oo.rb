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
class Grid
	attr_accessor :board

	def initialize
		i=0
		9.times do 
			board[i] = " "
			i+=1
		end
	end


  def draw
	puts "\e[H\e[2J" #Clean Screen
	@board.each_with_index do |choice, i|
		print choice
		print  "|"  if ((i+1)%3) != 0
		print "\n---------\n" if i == 2 || i  ==5 || i==8
	end
  end

  
def arbitration(icon)
  win_pattern=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  win_pattern.each do |w|
    if (@board[w[0]]==icon) && (arr[w[1]]==icon) && (arr[w[2]]==icon)
      return TRUE # icon wins!
  else
  	return FALSE
end

def empty?(choice)
  return TRUE if choice<0 && choice >8
  return (@board[choice]==" ")?  TRUE : FALSE
end

def full?
  a=@board.select {|b| b==" "}
  return (a.length == 0)? TRUE : FALSE
end

end

class Player
	attr_accesor :icon

	def initialize(icn)
		@icon=icn
	end

	def choose_by_input
  	begin
		puts "Input your move (0..8)"
		inp =gets.chomp.downcase
		ch= inp.to_i
  	end while  !empty?(ch)
	end

	def choose_by_rand
		  begin
			ch=rand(8)
 		end while !empty?(ch)
 	end

end

#Initialize Grid
grid= Grid.new
grid.draw

player1 = Player.new("O")
player2 = Player.new("X")

loop do #Game begin

  #Player Choice

  player1.choose_by_input
  grid.board[player1.choice] = player1.icon
  grid.draw

  if grid.arbitrate(player1.icon)
    puts "You won!" 
    break
  end

  if grid.full?
    puts "Grid Full!"
    break
  end


  #Computer Choice
 player2.choose_by_rand
  grid.board[player2.choice] = player2.icon
  grid.draw

  if grid.arbitrate(player2.icon)
    puts "Computer won!" 
    break
  end
  
  if grid.full?
    puts "Grid Full!"
    break
  end

  puts "Want to player again?"
  again=gets.chomp.downcase
  if again !=  "y"
  	break
  end

end



