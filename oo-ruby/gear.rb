#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	Author: Ramkumar Kuppuchamy
	At    : 19/08/2014
=end
class Gear

     attr_reader :cog, :chainring
     def initialize(chainring,cog)
	@chainring = chainring
	@cog = cog
     end

     def calculate_ratio
	chainring / cog.to_f
     end
end
puts "Big Gear ::: #{Gear.new(52,12).calculate_ratio}"
puts "Small Gear ::: #{Gear.new(42,32).calculate_ratio}"
