#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 Author: Ramkumar Kuppuchamy
 File: main file for the conf schedule problem
=end

# Load the util file

load "conf_schedule_util.rb"

#=============================== PARSE_INPUT_DATA METHOD =============================

def parse_input_data(input_file)
   puts "parsing the input file......" 
   file_content = []
   conf_track_input = {}
   File.foreach(input_file) {|line| file_content << line.chomp!}
   
   file_content.each do |line|
      conf_session_time = line.split(' ').last
      if conf_session_time.include? "min"
            conf_session_time = conf_session_time[0..1]
      elsif conf_session_time == "lightning"
           conf_session_time = 5       
      else
           raise "Not able to find the proper test case with the mins specified at the end"
      end
      
      conf_track_input.merge!( line => conf_session_time.to_i )
      puts "Conf Session Time: #{conf_session_time}"
   end
   puts "Conf Track Input hash:: #{conf_track_input}\n"
  
  totalTime = calculate_totaltime(conf_track_input) 
  
end

def calculate_totaltime(conf_track_input)
   totalTime = (conf_track_input.values).inject(0) {|result,element| result+element }
   
   puts "Total hours ====== #{totalTime}"
   totalTime
end


# ====================== PROGRAM EXECUTION STARTS HERE =================================
if __FILE__ == $0

puts "Entering into main method"
 
  #print the information
  print_info 
  
  #Get the input file

  if ARGV.length > 0
    input_file = get_input_file(ARGV[0])
  else
     puts "Please pass the input file as argument"
  end

  #Read the input file

  if File.exist?(input_file)
      parse_input_data(input_file)
  else
      puts "Error Reading the input file"
  end

end
