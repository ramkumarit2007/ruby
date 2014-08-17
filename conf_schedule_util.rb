#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

#Read the input file and get the data

#====================================== GET_INPUT_FILE METHOD =====================================
def get_input_file(input_file)
  puts "-------------- Entering get_input_file() Method"
  if File.exist?(input_file)
      input_file = File.open(File.join(File.dirname('__FILE__'),input_file),"r")
      puts "Got the input file with read mode"
  else
      puts "Please check the input file exists"
      raise "Error in reading the input file"
  end

  puts "--------------- Exiting get_input_file() Method"
  input_file
end

#====================================== PRINT_INFO METHOD ==========================================

def print_info
  print <<EOF
  ****************************************************************************************** 
     Info: 
          This program needs a input file as first argument to proceed.
  ****************************************************************************************** 

EOF
end

