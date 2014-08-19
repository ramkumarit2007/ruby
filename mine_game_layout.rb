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
  is_game = true
  minegame = MineGame.new(mine.getMineLayout,user_option)
  updated_layout = minegame.locate_mine
  print_layout(updated_layout)
  if is_game
    puts "you won the game"
  else
    puts "you are out!!"
  end
end
