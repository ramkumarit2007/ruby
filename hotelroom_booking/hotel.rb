#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
This program is for  finding the cheapest hotel among three (LakeWood,BridgeWood,RidgeWood) for regular and rewards customer.
=end

#require the relative sub classes :: Ruby 1.9+ it is require_relative to include other files

class Hotel
     attr_reader :cust_type, :dates

     #Initialize method which gets the arguments, customer type and the date range for hotel stay
     def initialize(stay_details)
	@cust_type = stay_details[:cust_type]	
	@dates = stay_details[:dates]
     end
    
     #Get the hotel fares by passing the each object with the self and store it in a hash where key is hotel name and value is fare
     def get_hotel_fares(hotels)
        fare_list = Hash.new
 	hotels.each do | hotel |
	  fare_list[hotel.class.name] = hotel.get_fare(self)
	end
        fare_list
     end
 
     #Define the get_fare method to get the fare from each hotel and lets compare at the end to find the cheapest hotel
     def get_fare
	raise NotImplementedError,
	  "This class #{self.class.to_s} can not respond to the method::: #{__method__.to_s}"
     end
 
     #Initializing the fare for each hotel for regular and rewards customer for weekend and weekday stay in their own class.
     def my_fare
	raise NotImplementedError,
	   "This class #{self.class.to_s} can not respond to the method::: #{__method__.to_s}"
     end

end
