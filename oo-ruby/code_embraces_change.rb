#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

class RevealingReferences
     attr_reader :wheels
     def initialize(data)
	@wheels = wheelify(data)
     end

     def diameters
	wheels.collect { |wheel|
	   wheel.rim + (wheel.tire *2) }
     end

     Wheel = Struct.new(:rim,:tire)
     def wheelify(data)
	data.collect { |cell| 
	    Wheel.new(cell[0],cell[1]) }
     end

end
