#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
	@Author: Ramkumar Kuppuchamy
	@Date: 09/11/2014
	This module will hold all the common behaviour or helper methods for the hotel room booking system
=end

module HotelHelper
    def know_your_day(stay_day)
        weekday = ['Mon','Tue','Wed','Thu','Fri']
        weekend = ['Sat','Sun']
	if weekday.any? { |day| day.include?(stay_day.capitalize) }
	   return "weekday"
        elsif weekend.any? { |day| day.include?(stay_day.capitalize) }
	   return "weekend"
        end
    end

    def calc_fare(hotel)
        hotel_fare = 0
        cust_type = hotel.cust_type.downcase
        dates = hotel.dates
        puts "\nCustomer Type::: #{cust_type}\tDates:::#{dates}"
        dates.each do | day |
             stay_day = know_your_day(day)
             hotel_fare += my_fare[cust_type][stay_day]
             puts " #{stay_day} Fare::: #{my_fare[cust_type][stay_day]}"
        end
        hotel_fare
    end

end
