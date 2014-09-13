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

def get_cheapest_hotel(hotels_fare_list,hotels)
    sorted_hotels_byrate = hotels_fare_list.sort{|k,v| k[1]<=> v[1]}
    #sorted_hotels_byrate.each { |e| puts "#{e[0]} => #{e[1]}" }
    lowest_rate = sorted_hotels_byrate.first[1]
    lowest_rate_hotel = ""
    puts "sorted hotel list ::: #{sorted_hotels_byrate}"
    #puts get_rating(hotels,"bridgewood")
    sorted_hotels_byrate.each do | hotel,rate |
        puts "hotel::: #{hotel}, rate: #{rate}, lowest_rate: #{lowest_rate}"
        this_hotel_rating = get_rating(hotels,hotel)
        if rate == lowest_rate
             good_rating ||= this_hotel_rating
             puts "good rating:: #{good_rating} :::: this hotel rating: #{get_rating(hotels,hotel)}\n\n"
          if good_rating <= this_hotel_rating
             good_rating = this_hotel_rating
             lowest_rate_hotel = hotel
          end
        else
             break
        end
    end

    lowest_rate_hotel
end

def get_rating(hotels,hotel)
    hotels.map {| h| return h.rating if (h.class.name.downcase).include?(hotel.downcase) }
end

def print_hotel_list(hotels)
    hotels.each_with_index { |hotel, index| puts "\t#{index+1}: #{hotel.class.name}" }
    puts "======================================================"
end

if __FILE__ == $0

    lakewood = LakeWood.new
    bridgewood = BridgeWood.new
    ridgewood = RidgeWood.new

    puts "LakeWood Rating: #{lakewood.rating},BridgeWood Rating: #{bridgewood.rating}, RidgeWood Rating: #{ridgewood.rating}"

    hotels = [lakewood,bridgewood,ridgewood]

    puts "=========== Hotels List :::: ========================="
    
    print_hotel_list(hotels)

    #@hotel = Hotel.new( :cust_type => 'RegUlar', :dates => ['MOn','tue','SuN'])
    #hotels_fare_list = @hotel.get_hotel_fares(hotels)
    #puts "The fare_list is :::: #{hotels_fare_list}"
    
    hotel = Hotel.new( :cust_type => 'REWARDS', :dates => ['MON','TUE','WED','THU','SAT','SUN'])
    
    hotels_fare_list = hotel.get_hotel_fares(hotels)
    puts "The fare_list is :::: #{hotels_fare_list}\n\n"
    hotel = get_cheapest_hotel(hotels_fare_list,hotels)
    puts "\n ******* Cheapest Hotel:::  #{hotel}\n\n"
end
