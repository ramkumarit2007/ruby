#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
puts "Enter the number to print the fibanocci series"
num = gets.chomp!
num = num.to_i

#Method for returning fibnocci series

def feb_seq(num)
 fib = [0]
 num.times do |t|
  if t == 0
    fib[t] = 0
  elsif t == 1
    fib[t] = 1
  else
    fib[t] = fib[t-1] + fib[t-2] 
  end
 end
 return fib[0..num]
end

#calling the feb_seq and print the returning results
puts feb_seq(num)
