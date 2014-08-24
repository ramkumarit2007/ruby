#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 This class explains the inheritance concept with abstracting the superclass and bringing specialized subclasses
 *** Explicitly specify super(args) in subclasses init when you want both subclass and superclass init needs to be called
=end

#Base class has the abstract details needed for the sub classes
class Bicycle
   attr_reader :size, :chain, :tire_size
   def initialize(args={})
      @size = args[:size]
      @chain = args[:chain]
      @tire_size = args[:tire_size]
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

end

road_bike = RoadBike.new(size: 'M',tape_color: 'Red', chain: '10-speed')
puts "Road Bike Size::: #{road_bike.size}\n chain::: #{road_bike.chain}"

mount_bike = MountainBike.new(size: 'S', chain: '20-speed', front_shock: 'Manitou', rear_shock: 'Fox')
puts "Mount Bike Size::: #{mount_bike.size}\n chain::: #{mount_bike.chain}"
