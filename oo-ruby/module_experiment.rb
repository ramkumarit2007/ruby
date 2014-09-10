#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
module Schedulable
  def test
    "This is returning from module"
  end
end

class One
   include Schedulable
   
   def test_one
      "This is returning from Object One"
   end
end
class Two
   include Schedulable
   
   def test_two
      "This is returning from Object Two"
   end
end
obj1 = One.new
obj2 = Two.new
puts "Result for Test ::: #{obj1.test}\nResult for Test One::: #{obj1.test_one}"
puts "Result for Test ::: #{obj2.test}\nResult for Test Two::: #{obj2.test_two}"
