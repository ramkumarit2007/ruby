#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
	
	This class is having the behaviour of BridgeWood hotel
=end

require_relative "hotel"
require_relative "hotel_helper"

class BridgeWood < Hotel

    attr_reader :rating
    #Included module hotelhelper for shared behaviours across hotels
    include HotelHelper

    def initialize 
	@rating = 4
    end

    def get_fare(hotel)
        ridgewood_fare = calc_fare(hotel)
	puts "Final Stay Fare @ BridgeWood ::: #{ridgewood_fare}"
	ridgewood_fare
    end

=begin
    def calc_fare(hotel)
        bridgewood_fare = 0
        cust_type = hotel.cust_type.downcase
        dates = hotel.dates
        puts "Customer Type::: #{cust_type}\tDates:::#{dates}"

        dates.each do | day |
	     stay_day = know_your_day(day)
             bridgewood_fare += my_fare[cust_type][stay_day]
             puts " #{stay_day} Fare::: #{my_fare[cust_type][stay_day]}"
        end
        bridgewood_fare
    end
=end    
    def my_fare
        {"regular" => {"weekday" => 160, "weekend" => 60}, "rewards" => {"weekday" => 110, "weekend" => 50} }
    end

end
