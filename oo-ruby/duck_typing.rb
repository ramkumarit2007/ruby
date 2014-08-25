#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby

=begin
 ---  This explains the concept of duck typing - public interface to not to depend on objects but it is depend on the object which it receives to respond on 
 --- this will not get executed as it needs dependency classes need to be created
=end
class Trip
   attr_reader :bicycles, :customers, :vehicle
   def prepare(preparers)
     preparers.each do |preparer|
	preparer.prepare_trip(self)
     end
   end
=begin
before duck type there were no explicit method "prepare_trip" and we might have called individual objects (Mechanic,Food,etc) like..
  `case 
  when Mechanic
    preparer.prepare_bicycles(bicycles)
  when TripCoordinator
    preparer.buy_food(customers)
  end`
=end
end

class Mechanic
   def prepare_trip(trip)
     trip.bicycles.each do | bicycle|
       prepare_bicycle(bicycle)
     end
   end
   private
   def prepare_bicycle(bicycle)
     puts " bicycle is prepared"
   end
end

class TripCoordinator
   def prepare_trip(trip)
     buy_food(trip.customers)
   end

   private
   def buy_food
     puts "Food has been bought"
   end
end

class Driver
    def prepare_trip(trip)
       gas_up(trip.vehicle)
       fill_water_tank(vehicle)
    end

    def gas_up
       puts "gas has been filled" 
    end

    def fill_water_tank
       puts "water tank has been filled"
    end

end

if __FILE__ == $0
 @driver = Driver.new
 @trip_coordinator = TripCoordinator.new
 @customer = Customer.new
 preparers = []
 preparers.insert(3,@driver,@trip_coordinator,@customer)

 Trip.new.prepare(preparers)

end
