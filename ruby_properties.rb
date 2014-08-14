#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

#require the yaml file

require 'yaml'

print <<EOF

 This program will load the YAML config file and then, it will parse the file contents

EOF

config = ""

#config = YAML.load_file("batsman.yaml")


def parse_contents(config)
   config.each do |players,data|
       puts "Key: #{players}, data: #{data}" 
       data.each do |list|
          list.each do |key,value|
              puts "key: #{key}, value: #{value}"
          end
       end
   end
end


#Load the config file to get the data
if ARGV[0]
   config = YAML.load_file(File.join(File.dirname(__FILE__), ARGV[0]))
   parse_contents(config)
else
   puts "Pass the YAML file as the first argument"
end
