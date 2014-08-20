#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
        Author: Ramkumar Kuppuchamy
        At    : 19/08/2014
=end
=begin
1. This program examines, creating instances of objects in one another in the worst case where you are not able to move them ,even that time go for lazy loading initialization
2. This uses hash as the intialization arguments - this removes the fixed argument order
3. set defaults for the arguments (dont use || because for the boolean arguments that will not work expected, instead use 'fetch'
4. make a separate method for the defaults when it gets complicated
=end

class Gear

     attr_reader :cog, :chainring, :rim, :tire
     def initialize(args)

	#call defaults hash before intializing to set the missing keys
	args = defaults.merge(args)
        @chainring = args[:chainring]
        @cog = args[:cog]
	@rim = args[:rim]
	@tire = args[:tire]
 	#@chainring = args.fetch(:chainring, 40)
	#@cog = args.fetch(:cog,18)
	#@rim = args.fetch(:rim,25)
	#@tire = args.fetch(:tire,1.3)
     end

     def defaults	
	{:chainring => 40, :cog => 18, :rim => 25, :tire => 1.3 }
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

#The below initialization misses two arguments, but with this design still works
puts "Small Gear ::: #{Gear.new( :chainring => 42, :cog => 32).gear_inches}"

