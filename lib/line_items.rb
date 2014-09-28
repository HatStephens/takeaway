
require_relative 'dish'

class LineItem

	attr_reader :line_item_list, :total_cost

	def initialize
		@line_item_list = []
		@total_cost = 0
	end

	def add_order(dish, quantity)
		@line_item_list << [dish.name, quantity, dish.cost*quantity]
	end

	def request_total_cost=(amount)
		@total_cost = amount
	end

end