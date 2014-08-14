#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

puts "Enter the number to reverse"
num = gets.chomp!

puts num.to_s.reverse.to_i if num!=""

unless num=="" 
   puts num.to_s.reverse.to_i
end

age = 95

case age
when 0..11
   puts "child" 
when 15..19
   puts "teen"
when 20..29
   puts "adult"
else
   puts "old"
end

#puts num.methods
