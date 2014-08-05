def isPalindrome
	puts "Enter the string to check for palindrome"
	value=gets.chomp!
	if value == value.reverse
		puts "#{value} is a palindrome"
	else
		puts "#{value} is not a palindorme"
	end
end

isPalindrome
