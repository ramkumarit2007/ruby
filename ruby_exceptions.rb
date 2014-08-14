#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
def raise_exceptions
   puts "before raising the exception"
   raise "an error occured"
   rescue
   puts "after rescued"
   puts "after raising the exception"
end
raise_exceptions
