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
        @board = []
        i=0
        9.times do  
            @board[i] = " "
            i+=1
        end
  end

    def draw
       puts "\e[H\e[2J" #Clean Screen
       puts "   |    |   "
       puts "#{@board[0]}  | #{@board[1]}  |  #{@board[2]}"
       puts "   |    |   "
       puts "------------ "
       puts "   |    |    "
       puts "#{@board[3]}  | #{@board[4]}  |  #{@board[5]}"   
       puts "   |    |   "
       puts "------------ "
       puts "   |    |    "    
       puts "#{@board[6]}  | #{@board[7]}  |  #{@board[8]}"          

  end

  def arbitrate(icon)
      win_pattern=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
      win_pattern.each do |w|
      if (@board[w[0]]==icon) && (@board[w[1]]==icon) && (@board[w[2]]==icon)
          return TRUE # icon wins!
      end #endif
      end #end each
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

  def choose_by_input
    begin
    puts "Input your move (0..8)"
    inp =gets.chomp.downcase
    ch= inp.to_i
    end while  !empty?(ch)
    return ch
  end

  def choose_by_rand
      begin
      ch=rand(8)
    end while !empty?(ch)
    return ch
  end


end # End Class Grid

class Player
  attr_accessor :icon, :choice

  def initialize(icn)
    @icon=icn
    @choice = nil
  end
end  
#End Class Player



class Game
  attr_accessor :grid, :player1, :player2

  def initialize

  end

  def run
    @grid= Grid.new
    @grid.draw

    @player1 = Player.new("O")
    @player2 = Player.new("X")

loop do #Game begin

  #Player Choice

  @player1.choice = @grid.choose_by_input
  @grid.board[@player1.choice] = @player1.icon
  @grid.draw

  if @grid.arbitrate(@player1.icon)
    puts "You won!" 
    break
  end

  if @grid.full?
    puts "Grid Full!"
    break
  end


  #Computer Choice
  @player2.choice = @grid.choose_by_rand
  @grid.board[@player2.choice] = @player2.icon
  @grid.draw

  if @grid.arbitrate(@player2.icon)
    puts "Computer won!" 
    break
  end
  
  if @grid.full?
    puts "Grid Full!"
    break
  end

end #end Loop
puts "BYE!"
#  puts "Want to player again?"
#  again=gets.chomp.downcase
#  if again !=  "y"
#    break
#  end
end #end run
end #Class Game

Game.new.run




