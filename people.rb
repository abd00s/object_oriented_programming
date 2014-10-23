class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greet
		puts "My name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

chris = Instructor.new("Chris")
chris.greet

christina = Student.new("Christina")
christina.greet

chris.teach

christina.learn
					#|==============================================================|
chris.learn			#| Methods are being called on classes where theyre not defined |
					#| Error message:  												|
christina.teach 	#| NoMethodError												|
					#|==============================================================|