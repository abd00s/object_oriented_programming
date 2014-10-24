
class Rover

	attr_accessor :x, :y, :h

	# Assign an initial location (x,y) and direction (h) for the rover
	# h accepts: "N", "E", "S" or "W"
	def initialize(x, y, h)
		@x = x
		@y = y
		@h = h
	end

	# Reads user's input and decides weather to turn (L,R) or move (M)
	def read_instruction(str)
		str.split(//).each do |instruction|
			if instruction == "M"
				#puts "Move forward one space"
				move
			elsif instruction == "R"
				#puts "Turn 90 deg to right"
				turn_right
			elsif instruction == "L"
				#puts "Turn 90 deg to left"
				turn_left	
			else
				puts "I do not recognise that instruction"
			end		 	 
		end		
	end

	# Moves to new (x,y) location based on user's input
	def move
		if @h == "N"
			@y += 1
		elsif @h == "E"
			@x += 1
		elsif @h == "S"
			@y -= 1
		elsif @h == "W"
			@x -= 1
		else
			puts "Direction not Recognized"
		end
												
	end

	def turn_right
		if @h == "N"
			@h = "E"
		elsif @h == "E"
			@h = "S"
		elsif @h == "S"
			@h = "W"
		elsif @h == "W"
			@h = "N"
		else
			puts "Direction not Recognized"
		end
	end

	def turn_left
		if @h == "N"
			@h = "W"
		elsif @h == "E"
			@h = "N"
		elsif @h == "S"
			@h = "E"
		elsif @h == "W"
			@h = "S"
		else
			puts "Direction not Recognized"
		end
	end
end

rovers = [] 
$count = 0
more = true

puts "What is the size of your grid (top-right coordinated sepearted by a space):"

$grid_x, $grid_y = gets.chomp.split


puts "The size of your grid is (#{$grid_x}, #{$grid_y})"

while more
	puts "Where do you want to place your rover (x, y, direction):"

	x, y, h = gets.chomp.split 
	rovers << Rover.new(x.to_i, y.to_i, h)
	$count += 1
	puts "You have initiated a rover at position (#{x}, #{y}), facing #{h}"

	puts "Enter your string of instructions (all caps, no spaces): "
	commands = gets.chomp
	rovers[$count -1].read_instruction(commands)

	puts "Your rover has moved to position (#{rovers[$count - 1].x}, #{rovers[$count - 1].y}) and is facing #{rovers[$count-1].h}"
	puts
	puts "More rovers? (y/n)"
	more = false if gets.chomp == "n" 
end


row_a = ["---"]*$grid_x.to_i
separator = ([""]+row_a+[""]).join('+')

$grid_y.to_i.times do |row|
	puts separator


	row_b = ["   "]*$grid_x.to_i

	if rovers[0].y == row
		if rovers[0].h == "N"
			row_b[rovers[0].x] = " ^ " 
		elsif @h == "E"
			row_b[rovers[0].x] = " > "
		elsif @h == "S"
			row_b[rovers[0].x] = " v "
		elsif @h == "W"
			row_b[rovers[0].x] = " < "
		end
				
	end

	puts ([""]+row_b+[""]).join('|')
end
puts separator		
