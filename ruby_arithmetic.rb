
def add(a,b)
 puts "The given values are : #{a},#{b}"
#a-b
 a+b
end

def sub(a,b)
 a-b
end

def mul(*num)
=begin 
if num.count > 0
    mul=1
    num.each do |t|
      mul *= t
    end
    puts "Multiply In arithmetic: #{mul}"
 end
=end
 num.inject {|result,element| result*element}
end
