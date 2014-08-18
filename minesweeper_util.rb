#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 Author - Ramkumar Kuppuchamy
 AT - ThoughtWorks Interview Process
 Date -  18/08/2014
=end

#========================= PRINT LAYOUT Method ==============================

#Method to validate the given mine layout
  def validate_layout(layout_grid)
     #puts " Given Layout --- #{@mineLayout.split(',')}"
     flag = true
     layout_grid.each_with_index do | layout, index |
        unless layout.length != layout_grid[index-1].length 
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

