require_relative './item.rb'

class Receipt
	def initialize
		@items = []
		@taxes = 0
		@total = 0
	end

	def add_item
		loop do 
			print_items
			item_to_add = gets.chomp.to_i
			name = translate_item(item_to_add)
			puts "Enter price:"
			item_price = gets.chomp.to_f
			tax_applicable = tax_applicable(name)
			puts "Is the item imported? (y/n)"
			is_imported = gets.chomp.downcase
			imported = imported(is_imported)
			new_item = Item.new(name, item_price, tax_applicable, imported)
			@items << new_item
			puts "Add more items?"
			y_or_no = gets.chomp.downcase
			break if y_or_no == "n" 
		end
	end

	def print_items
		puts "Select Item to add:"
		puts "[1] Book"	
		puts "[2] Music CD"
		puts "[3] Chocolate Bar"
		puts "[4] Box of Chocolates"
		puts "[5] Bottle of Perfume"
		puts "[6] Headache Pills"
	end


	def translate_item(number)
		items = ["Book", "Music CD", "Chocolate Bar", "Box of Chocolates", "Bottle of Perfume", "Headache Pills"]
		return items[number - 1]
	end

	def tax_applicable(item)
		return ["Music CD", "Bottle of Perfume"].include?(item) ? true : false
	end

	def imported(y_or_no)
		return y_or_no == "y" ? true : false 
	end

	def self.run
		receipt = Receipt.new
		receipt.add_item
	end
end

Receipt.run