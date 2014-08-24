#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 This class explains the inheritance concept with abstracting the superclass and bringing specialized subclasses
 *** Explicitly specify super(args) in subclasses init when you want both subclass and superclass init needs to be called
=end

#Base class has the abstract details needed for the sub classes. Just defined the 'chain' method here, which does the default assignment here but in sub-class it does the specific operation (default assignment for tire sizes). This is called Template Pattern.

class Bicycle
   attr_reader :size, :chain, :tire_size
   def initialize(args={})
      @size = args[:size]
      @chain = args[:chain]  || default_chain
      @tire_size = args[:tire_size] || default_tire_size
   end

   def default_chain
      '10-speed'
   end

   def spares
      { tire_size: tire_size, chain: chain}
   end

  #If any of the sub classes does not implement this method, then raise an not implementedmethod error
   def default_tire_size
     raise NotImplementedError, 
       "This #{self.class.to_s} can not respond_to :: #{__method__.to_s}"
   end
end

#This class has the specific behaviour for the MountainBike
class MountainBike < Bicycle

  attr_reader :front_shock, :rear_shock
  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end
   
  def default_tire_size
    '2.1'
  end
  
  def spares
    super.merge(:rear_shock => rear_shock)
  end 
end

#This class has the specific behaviour for the RoadBike
class RoadBike < Bicycle

   attr_reader :tape_color
   def initialize(args)
      @tape_color = args[:tape_color]
      super(args)
   end
   
   def default_tire_size
     '20'
   end

   def spares
     #{ chain: '10-speed', tire_size: '20', tape_color: tape_color} 
     super.merge({:tape_color => tape_color})
   end
end

#This class has the specific behaviour for the RecumbentBike
class RecumbentBike < Bicycle
   def default_chain
     '9-speed'
   end

   def default_tire_size
     '3.2'
   end
   
end

#road_bike = RoadBike.new(size: 'M',tape_color: 'Red', chain: '10-speed')
road_bike = RoadBike.new(size: 'M', tape_color: 'Red')
puts "Road Bike Tire Size::: #{road_bike.tire_size}\n chain::: #{road_bike.chain}"
puts "Spares:::: #{road_bike.spares}"
#mount_bike = MountainBike.new(size: 'S', chain: '20-speed', front_shock: 'Manitou', rear_shock: 'Fox')
mount_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
puts "Mount Bike Tire Size::: #{mount_bike.tire_size}\n chain::: #{mount_bike.chain}"
puts "Spares:::: #{mount_bike.spares}"

recumbent_bike = RecumbentBike.new
puts "Recumbent Bike Chain::: #{recumbent_bike.chain}"


