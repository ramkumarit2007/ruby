#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
class Employee
   @@count = 0
    def initialize(id,name)
	@id,@name = id,name
	@@count += 1
    end
    
    #Accessor methods
    def print_id
	@id
    end

    def print_name
	@name
    end

    def setId=(value)
       @id = value
    end

    def setName=(value)
       @name = value
    end

    def self.printEmployee
      puts "Employee Count: #@@count"
    end

    def to_s
       "(id:#@id,name:#@name)" #String formatting of an object 
    end
end

emp1 = Employee.new(1016,"Ramkumar Kuppuchamy")
emp2  = Employee.new(1006,"Aman Sharma")

emp_id,emp_name = emp1.print_id, emp1.print_name

#calling the instance method

Employee.printEmployee

puts "Employee1 Object: #{emp1}\n"
puts "Employee2 Object : #{emp2.inspect}\nEmp id: #{emp_id}\nEmp Name: #{emp_name}"

