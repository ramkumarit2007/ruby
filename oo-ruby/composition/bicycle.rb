#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
=begin
 @author: Ramkumar Kuppuchamy
 @date: 09/12/2014
 This class will have the parts delegated as a new class, which brings composition in place
=end

class Bicycle
     attr_reader :size, :parts
     def initialize(args={})
        @size = args[:size]
	@parts = args[:parts]
     end

     def spares
        parts.spares
     end
end
