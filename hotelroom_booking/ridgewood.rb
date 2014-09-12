#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
	
	This class is having the behaviour of RidgeWood hotel
=end

require_relative "hotel"
require_relative "hotel_helper"

class RidgeWood < Hotel
  #Included module hotelhelper for shared behaviours across hotels
    include HotelHelper

    def initialize 
        @rating = 5
    end

    def get_fare(hotel)
        ridgewood_fare = calc_fare(hotel)
	puts "Final Stay Fare @ LakeFood ::: #{ridgewood_fare}"
	ridgewood_fare
    end

=begin
    def calc_fare(hotel)
        ridgewood_fare = 0
        cust_type = hotel.cust_type.downcase
        dates = hotel.dates
        puts "Customer Type::: #{cust_type}\tDates:::#{dates}"

        dates.each do | day |
            stay_day = know_your_day(day)
            ridgewood_fare += my_fare[cust_type][stay_day]
            puts "#{stay_day} Fare::: #{my_fare[cust_type][stay_day]}"
	end
        ridgewood_fare
    end
=end
    def my_fare
        {"regular" => {"weekday" => 220, "weekend" => 150}, "rewards" => {"weekday" => 100, "weekend" => 40} }
    end

end
