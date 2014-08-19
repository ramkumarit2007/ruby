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
     def locate_mine
        is_game = true
        cell_flagged  = false
        index1,index2 = @option[2].to_i,@option[4].to_i
        choose = @option[0]
        @layout.each do | layoutVal |
          layoutVal.split("").each do | value |
            if @layout[index1][index2] == 'm' and choose == 'o'
              puts "Opened the mine -- You are OUT!!"
              is_game = false
             elsif @layout[index1][index2] == 'x' and choose == 'o'
               puts "You have opened the cell"
               @layout[index1][index2] = '0'
             elsif @layout[index1][index2] == 'm' and choose == 'f'
               @layout[index1][index2] = 'f'
             elsif @layout[index1][index2] == 'x' and choose == 'f'
               puts "You have flagged the cell"
               @layout[index1][index2] = 'f'
               cell_flagged  = true
           end
          end
         end
=begin       if value != "f" or value == '0' 

          else
            if cell_flagged
               puts "You have flagged some cells, GAME OVER!!"
            else
               puts "Congrats!!! You have won the Game!"
            end
=end
         @layout
      end 
end
