#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
	
	This class is having the behaviour of LakeWood hotel
=end

require_relative "hotel"
require_relative "hotel_helper"

class LakeWood < Hotel
    
    attr_reader :rating 
    #Included module hotelhelper for shared behaviours across hotels
    include HotelHelper

    def initialize 
	@rating = 3
    end

    def get_fare(hotel)
	lakewood_fare = calc_fare(hotel)
	puts "Final Stay Fare @ LakeWood ::: #{lakewood_fare}"
	lakewood_fare
    end

=begin
     def calc_fare(hotel)
	lakewood_fare = 0
	cust_type = hotel.cust_type.downcase
	dates = hotel.dates
	puts "Customer Type::: #{cust_type}\tDates:::#{dates}"
	dates.each do | day |
	     stay_day = know_your_day(day)
             lakewood_fare += my_fare[cust_type][stay_day]
	     puts " #{stay_day} Fare::: #{my_fare[cust_type][stay_day]}"
	end
        lakewood_fare	
    end
=end    
    def my_fare
	{"regular" => {"weekday" => 110, "weekend" => 90}, "rewards" => {"weekday" => 80, "weekend" => 80} }
    end
end
