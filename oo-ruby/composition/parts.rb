#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
  @author: Ramkumar Kuppuchamy
  @date: 09/12/2014
  this class will hold the bicycle attributes
=end
require_relative "bicycle"
class Parts
     attr_reader :chain, :tire_size

     def initialize(args={})
        @chain = args[:chain] || default_chain
        @tire_size = args[:tire_size] || default_tire_size
        post_initialize(args)
     end

   def default_chain
      '10-speed'
   end

   def spares
      { tire_size: tire_size, chain: chain}.merge(local_spares)
   end

   #If the subclasses does not implement this method then no etc values will be merged with the default hash
   def local_spares
     {}
   end

   #If the subclasses does not define this methods then nothing will get initialized etc other than super class attributes
   def post_initialize
     nil
   end

  #If any of the sub classes does not implement this method, then raise an not implementedmethod error
   def default_tire_size
     raise NotImplementedError, 
       "This #{self.class.to_s} can not respond_to :: #{__method__.to_s}"
   end
end

#This class has the specific behaviour for the MountainBike
class MountainBikeParts < Parts

  attr_reader :front_shock, :rear_shock

#Instead of sending super to init the args, let add hook impl method, so it gets initialized when that is need to be 
  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    #super(args)
  end
   
  def default_tire_size
    '2.1'
  end
  
#Instead of calling the spares with super, now let the super  class handles that, it just do the specific spare needed
  def local_spares
    #super.merge(:rear_shock => rear_shock)
    {:rear_shock => rear_shock}
  end 
end

#This class has the specific behaviour for the RoadBike
class RoadBikeParts < Parts

   attr_reader :tape_color

#Instead of sending super to init the args, let add hook impl method, so it gets initialized when that is need to be 
   def post_initialize(args)
      @tape_color = args[:tape_color]
   end
   
   def default_tire_size
     '20'
   end

#Instead of calling the spares with super, now let the super  class handles that, it just do the specific spare needed
   def local_spares
     #{ chain: '10-speed', tire_size: '20', tape_color: tape_color} 
     #super.merge({:tape_color => tape_color})
     {:tape_color => tape_color}
   end
end

#This class has the specific behaviour for the RecumbentBike
class RecumbentBikeParts < Parts

   attr_reader :flag
  
#Instead of sending super to init the args, let add hook impl method, so it gets initialized when that is need to be 
   def post_initialize(args)
     @flag = args[:flag]
   end

   def default_chain
     '9-speed'
   end

   def default_tire_size
     '3.2'
   end
   
#Instead of calling the spares with super, now let the super  class handles that, it just do the specific spare needed
   def local_spares
     {:flag => flag} 
   end
end

road_bike = Bicycle.new(size: 'L',parts: RoadBikeParts.new(tape_color: 'red'))
puts "MBike size::: #{road_bike.size}"
puts "MBike Spares :: #{road_bike.spares}"
mountain_bike = Bicycle.new(size: 'L',parts: MountainBikeParts.new(rear_shock: 'Fox'))
puts "MBike size::: #{mountain_bike.size}"
puts "MBike Spares :: #{mountain_bike.spares}"


