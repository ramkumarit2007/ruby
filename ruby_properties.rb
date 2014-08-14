#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

#require the yaml file

require 'yaml'

config = YAML.load_file(File.join(File.dirname(__FILE__), ARGV[0]))
#config = YAML.load_file("batsman.yaml")

config.each do |players,data|
 puts "Key: #{players}, data: #{data}" 
 data.each do |list|
   list.each do |key,value|
     puts "key: #{key}, value: #{value}"
   end
 end
end

puts "Names: #{config["teams"]["name"]}"

