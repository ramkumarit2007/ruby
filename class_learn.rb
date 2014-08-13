#!/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby
class Employee
   @@count = 0
    def initialize(id,name)
	@id,@name = id,name
	@@count += 1
    end
    
    #Accessor methods
    def getId
	@id
    end

    def getName
	@name
    end

    private :getId, :getName

    def setId=(value)
       @id = value
    end

    def setName=(value)
       @name = value
    end

    def self.printEmployee
      puts "Employee Count: #@@count"
    end

    def access_test
      puts "Testing the protected access"
    end

    protected :access_test

    def to_s
       "(id:#@id,name:#@name)" #String formatting of an object 
    end
end

emp1 = Employee.new(1016,"Ramkumar Kuppuchamy")
emp2  = Employee.new(1006,"Aman Sharma")

#We should not call the private methods outside of the clas
#mp_id,emp_name = emp1.getId, emp1.getName

#calling the instance method

Employee.printEmployee
#Commenting the below lines, since testing the getters with private access

#puts "Employee1 Object: #{emp1}\n"
#puts "Employee2 Object : #{emp2.inspect}\nEmp id: #{emp_id}\nEmp Name: #{emp_name}"

puts" Testing Access" 

# below call should give error since that method is defined as protected

#emp1.access_test

