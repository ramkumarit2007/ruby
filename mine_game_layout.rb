#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 Author - Ramkumar Kuppuchamy
 AT - ThoughtWorks Interview Process
 Date -  18/08/2014
=end

#Load the utility file which has the util methods

load "minesweeper_util.rb"
load "mine_game.rb"

#================================= MineGame class ===========================

class MineLayout

  def initialize(layout)
     @mineLayout = layout
  end

  def getMineLayout
     @mineLayout.split(',')
  end
  
#Method to validate the given mine layout
  def validate_layout(layout_grid)
     #puts " Given Layout --- #{@mineLayout.split(',')}"
     flag = true
     layout_grid.each_with_index do | layout, index |
        unless layout.length != layoutGrid[index-1].length 
          #puts " #{layout.length} and #{layoutGrid[index-1].length} are same"
        else
          flag = false
          raise "supply the valid mine layout"
          break
        end
     end 
  end 
  
#Method to print the layout
  def print_layout(layout_grid)

     puts "============================ LAYOUT =============================="
     layout_grid.each do |layout|
        puts "#{layout}\n"
     end

     puts "============================ LAYOUT =============================="
  end  
end

if __FILE__ == $0
  puts "Enter the minefield layout : "
  MineGameLayout = gets.chomp!
 #puts " --- #{MineGameLayout} --"
  mine = MineLayout.new(MineGameLayout)
  validate_layout(mine.getMineLayout)
  print_layout(mine.getMineLayout)
  
  puts "Enter option : "
  user_option = gets.chomp!
  puts user_option
  minegame = MineGame.new(mine.getMineLayout,user_option)
  is_game =  minegame.locate_mine(mine.getMineLayout,user_option)
  if is_game?
    puts "you won the game"
  else
    puts "you are out!!"
  end
end
