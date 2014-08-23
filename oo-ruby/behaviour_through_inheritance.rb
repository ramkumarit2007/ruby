#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 This shows how to achieve behaviour through inheritance
=end
class Bicycle
   attr_reader :size, :tape_color
   def initialize(args)
      args.merge(spares)
      @size = args[:size]
      @tape_color = args[:tape_color]
   end

   #private
   def spares
      {:size => '23', :chain => '10-Speed',:tape_color => tape_color}
   end
end

bike = Bicycle.new(:size => 'M', :tape_color => 'red')
puts "bike size :: #{bike.size}"
puts "bike spares :: #{bike.spares}"
