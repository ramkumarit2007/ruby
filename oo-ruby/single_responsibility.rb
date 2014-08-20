#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
        Author: Ramkumar Kuppuchamy
        At    : 19/08/2014
=end
class Gear

     attr_reader :cog, :chainring, :wheel
     def initialize(chainring,cog,wheel=nil)
        @chainring = chainring
        @cog = cog
	@wheel = wheel	     
     end

     def ratio
        chainring / cog.to_f
     end
     
     def gear_inches
        ratio * wheel.diameter
     end
end

class Wheel
    attr_reader :rim, :tire
    def initialize(rim,tire)
	@rim = rim
	@tire = tire
    end
    
    def diameter
	rim + (tire * 2)
    end
 
    def circumference
	diameter * Math::PI
    end

end

@wheel = Wheel.new(26,1.5)
puts "Circumference ::: #{@wheel.circumference}"
puts "Big Gear Inches::: #{Gear.new(52,11,@wheel).gear_inches}"
puts "Ratio ::: #{Gear.new(52,11).ratio}"
#puts "Small Gear ::: #{Gear.new(42,32).calculate_ratio}"
#puts "Big Gear ::: #{Gear.new(42,32,26,1.5).calculate_gear_inches}"
#puts "Small Gear ::: #{Gear.new(42,32,24,1.25).calculate_gear_inches}"

