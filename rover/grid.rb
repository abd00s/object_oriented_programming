width = 9
height = 9
@x = 6
@y = 4
@h = "N"
row_a = ["---"]*width
separator = ([""]+row_a+[""]).join('+') 

height.times do |row|
	puts separator


	row_b = ["   "]*width

	if @y == row
		if @h == "N"
			row_b[@x] = " ^ " 
		elsif @h == "E"
			row_b[@x] = " > "
		elsif @h == "S"
			row_b[@x] = " v "
		elsif @h == "W"
			row_b[@x] = " < "
		end
				
	end

	puts ([""]+row_b+[""]).join('|')
end
puts separator