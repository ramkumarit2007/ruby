#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
class Area
   AUTHOR = "RAMKUMAR KUPPUCHAMY"
   
   #Attribute definitions to the getters,setters and accessors

   #attr_reader :height, :width
   #attr_writer :height, :width
   #attr_accessor :height, :width 

   def initialize(a,b)
       @width,@height = a,b
   end

   def getArea
       @width * @height
   end
end

class Square < Area
    def getArea
	@area = @width * @height
    end
end

class Rectangle < Area
    def getArea
        @area = @width * @height
    end
end

class Triangle < Area
   
     def initialize(a,b,c)
        @width,@height,@base = a,b,c
     end

     def getArea
        @area = @width*@height*@base
     end
end

square_area = Square.new(10,10)
rect_area = Rectangle.new(10,20)
tri_area = Triangle.new(10,20,30)
tri_area1 = Area.allocate

puts "Allocated Triangle Area: #{tri_area1.getArea}"

puts Area::AUTHOR

puts "Area of Square: #{square_area.getArea}\nArea of Rectangle: #{rect_area.getArea}\nArea of Triangle: #{tri_area.getArea}"
