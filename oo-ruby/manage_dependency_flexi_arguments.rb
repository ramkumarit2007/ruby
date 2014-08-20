#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
        Author: Ramkumar Kuppuchamy
        At    : 19/08/2014
=end
=begin
1. This program examines, creating instances of objects in one another in the worst case where you are not able to move them ,even that time go for lazy loading initialization
2. This uses hash as the intialization arguments - this removes the fixed argument order
=end

class Gear

     attr_reader :cog, :chainring, :rim, :tire
     def initialize(args)
        @chainring = args[:chainring]
        @cog = args[:cog]
	@rim = args[:rim]
	@tire = args[:tire]
     end

     def ratio
        chainring / cog.to_f
     end
     
     def gear_inches
        ratio * wheel.diameter
     end

     def wheel
	@wheel ||= Wheel.new(rim,tire)
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
#puts "Big Gear Inches::: #{Gear.new(52,11,@wheel).gear_inches}"
#puts "Ratio ::: #{Gear.new(52,11).ratio}"
#puts "Small Gear ::: #{Gear.new(42,32).calculate_ratio}"

## Only when calling the gear_inches method, the 'wheel' objects get created
#puts "Big Gear ::: #{Gear.new(42,32,26,1.5).gear_inches}"
#puts "Small Gear ::: #{Gear.new(42,32,24,1.25).gear_inches}"
puts "Big Gear ::: #{Gear.new( :chainring => 42, :cog => 32, :rim => 26, :tire => 1.5).gear_inches}"
puts "Small Gear ::: #{Gear.new( :chainring => 42, :cog => 32, :rim => 24, :tire => 1.25).gear_inches}"

