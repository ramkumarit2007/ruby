#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

#get the input and store that in a file.
=begin
puts "Enter the content to be stored in a file"
content = gets
def file_write
   aFile = File.new("test.txt","w+")

   if aFile
     aFile.syswrite(content)
   else
     puts "Can not open file to write!!"
   end
end
=end
#file_write

def file_read
  
   aFile = File.new("test.txt","r")
   
   if aFile
     aFile.sysread(100)
   else
     puts "Can not open a file for Reading!!"
   end
end

puts file_read

if file_read
  #arr ||= file_read.split(' ')
  #puts "word count; #{arr.count}"
  puts "word count; #{file_read.split(' ').count}"
else
  puts "empty file"
end


