#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 This class explains the inheritance concept with abstracting the superclass and bringing specialized subclasses and also the Hook Messages
 *** Explicitly specify super(args) in subclasses init when you want both subclass and superclass init needs to be called
	features covered:::
        1. Inheritance
        2. Template Method
        3. Exception handing for every template method
        4. Hook messages for subclasses decoupling with super class
=end

#Base class has the abstract details needed for the sub classes. Just defined the 'chain' method here, which does the default assignment here but in sub-class it does the specific operation (default assignment for tire sizes). This is called Template Pattern.

class Bicycle
   attr_reader :size, :chain, :tire_size
   def initialize(args={})
      @size = args[:size]
      @chain = args[:chain]  || default_chain
      @tire_size = args[:tire_size] || default_tire_size
      #This method call actually removes the 'super'.initialize calling from subclass which intern makes these classes more decoupled
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
class MountainBike < Bicycle

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
class RoadBike < Bicycle

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
class RecumbentBike < Bicycle

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

#road_bike = RoadBike.new(size: 'M',tape_color: 'Red', chain: '10-speed')
road_bike = RoadBike.new(size: 'M', tape_color: 'Red')
puts "Road Bike Tire Size::: #{road_bike.tire_size}\n chain::: #{road_bike.chain}"
puts " Spares:::: #{road_bike.spares}"
#mount_bike = MountainBike.new(size: 'S', chain: '20-speed', front_shock: 'Manitou', rear_shock: 'Fox')
mount_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
puts "Mount Bike Tire Size::: #{mount_bike.tire_size}\n chain::: #{mount_bike.chain}"
puts " Spares:::: #{mount_bike.spares}"

recumbent_bike = RecumbentBike.new(flag: 'Tall & Orange')
puts "Recumbent Bike Tire Size::: #{recumbent_bike.tire_size}\n Chain::: #{recumbent_bike.chain}"
puts " Spares:::: #{recumbent_bike.spares}"

