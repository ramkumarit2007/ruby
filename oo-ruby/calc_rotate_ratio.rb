#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
chainring = 57
cog = 12
big_gear_ratio = chainring / cog.to_f
puts "Big Gear bicycle Ratio: #{big_gear_ratio}"

chainring = 32
cog = 26
small_gear_ratio = chainring / cog.to_f
puts "Small Gear bicycle Ratio: #{small_gear_ratio}"

