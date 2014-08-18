#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 Author - Ramkumar Kuppuchamy
 AT - ThoughtWorks Interview Process
 Date -  18/08/2014
=end
class MineGame
   
     def initialize(layout, option)
        @option = option
        @layout = layout
     end
     
     #Method to check for the mine or cell
     def locate_mine(layout,option)
        puts  "in locate mine ---- "
        is_game = true
        index1,index2 = option[2],option[4]
        choose = option[0]
        layout.each do | layoutVal |
          layoutVal.each do | value |
          if value != "f" or 0
            if layout[index1][index2] == 'm' and choose == 'o'
              puts "Opened the mine -- You are OUT!!"
             elsif layout[index1][index2] == 'x' and choose == 'o'
               puts "You have opened the cell"
               layout[index1][index2] = 0
             else
               
           end
          else
            
          end
        
     end 
end
