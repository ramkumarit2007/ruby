#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 This class explains the inheritance concept with abstracting the superclass and bringing specialized subclasses
 *** Explicitly specify super(args) in subclasses init when you want both subclass and superclass init needs to be called
=end

class Bicycle
   attr_reader :size
   def initialize(args={})
      @size = args[:size]
   end
end

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

class RoadBike < Bicycle

   attr_reader :tape_color
   def initialize(args)
      @tape_color = args[:tape_color]
      super(args)
   end

end

road_bike = RoadBike.new(size: 'M',tape_color: 'Red')
puts "Road Bike Size::: #{road_bike.size}"

mount_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
puts "Mount Bike Size::: #{mount_bike.size}"
