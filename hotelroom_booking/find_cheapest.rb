#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
	
	This is the main program which gets the input and finds the cheapest hotel
=end
require_relative "hotel"
require_relative "lakewood"
require_relative "bridgewood"
require_relative "ridgewood"

if __FILE__ == $0

    @lakewood = LakeWood.new
    @bridgewood = BridgeWood.new
    @ridgewood = RidgeWood.new
 
    hotels = [@lakewood,@bridgewood,@ridgewood]
    puts "Hotels List:::: #{hotels.to_s}"
    #@hotel = Hotel.new( :cust_type => 'RegUlar', :dates => ['MOn','tue','SuN'])
    #hotels_fare_list = @hotel.get_hotel_fares(hotels)
    #puts "The fare_list is :::: #{hotels_fare_list}"

    @hotel = Hotel.new( :cust_type => 'REWARDS', :dates => ['MON','TUE','SUN'])
    hotels_fare_list = @hotel.get_hotel_fares(hotels)
    puts "The fare_list is :::: #{hotels_fare_list}"
end
