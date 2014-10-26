class Item
	attr_accessor :name, :price, :tax_amount
	def initialize(name, price, tax_applicable, imported)
		@name = name
		@price = price
		@tax_applicable = tax_applicable
		@imported = imported
	end

	def tax_amount
		if @tax_applicable && @imported
			@tax_amount = @price * 0.15
		elsif @tax_applicable && !(@imported)
			@tax_amount = @price * 0.1
		elsif !(@tax_applicable) && @imported
			@tax_amount = @price * 0.05
		else   
			@tax_amount = 0
		end
	end
end