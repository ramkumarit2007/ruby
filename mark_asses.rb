puts "Enter marks separated by space"
getmarks = gets.chomp
marks = getmarks.split(' ').map {|e| e.to_i}
odd_sum = 0
even_sum = 0
marks.each do |mark|
    if mark.odd?
	odd_sum += mark
    else
	even_sum += mark
    end
end
    if odd_sum > even_sum
	puts "Big Odds at Passing"
    else
	puts " Big Evens at Passing"
    end
