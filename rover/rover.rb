
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
				move
			elsif instruction == "R"
				turn_right
			elsif instruction == "L"
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

# Initiated rovers held in this array 
rovers = [] 
# Keeps track of number of rovers deployed 
$count = 0
# Condition for while loop (deploy more rovers?)
more = true

puts
puts
puts "What is the size of your grid (top-right coordinated sepearted by a space):"

$grid_x, $grid_y = gets.chomp.split

puts
puts "The size of your grid is (#{$grid_x}, #{$grid_y})"
puts

# Loop to initiate multiple rovers; terminated with 'n' command

while more
	puts "Where do you want to place your rover (x, y, direction):"

	x, y, h = gets.chomp.split 
	rovers << Rover.new(x.to_i, y.to_i, h)
	$count += 1
	puts "You have initiated a rover at position (#{x}, #{y}), facing #{h}"
	puts
	puts "Enter your string of instructions (all caps, no spaces): "
	commands = gets.chomp
	rovers[$count -1].read_instruction(commands)

	puts "Your rover has moved to position (#{rovers[$count - 1].x}, #{rovers[$count - 1].y}) and is facing #{rovers[$count-1].h}"
	puts
	puts "More rovers? (y/n)"
	more = false if gets.chomp == "n" 
end

# Grid visualisation 

row_a = ["---"]*$grid_x.to_i
separator = ([""]+row_a+[""]).join('+')

count_arr = (0...$count)

$grid_y.to_i.times do |row|
	puts separator


	row_b = ["   "]*$grid_x.to_i
	count_arr.each do |rov|
			if rovers[rov].y == row
				if rovers[rov].h == "N"
					row_b[rovers[rov].x] = " ^ " 
				elsif rovers[rov].h == "E"
					row_b[rovers[rov].x] = " > "
				elsif rovers[rov].h == "S"
					row_b[rovers[rov].x] = " v "
				elsif rovers[rov].h == "W"
					row_b[rovers[rov].x] = " < "
				end
			end
				
		end

	puts ([""]+row_b+[""]).join('|')
end
puts separator		
puts
