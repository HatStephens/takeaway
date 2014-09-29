require_relative 'line_items'
require_relative 'customer'

class PlaceOrder
	include Twilio

	attr_reader :final_order, :customer_total, :total_cost, :calculate_total_cost
	attr_writer :total_cost, :customer_total

	def initialize
		@final_order = []
		@total_cost = 0
		@customer_total = 0
	end

	def receive_line_items(line_items)
		@final_order << line_items.line_item_list
	end

	def calculate_total_cost
		@final_order.each_with_index { |element, index| @total_cost += @final_order[index][index][2].to_i }
		@total_cost
	end

	def get_total_from_customer(line_items)
		@customer_total = line_items.total_cost_from_customer
	end

	def is_total_correct?
		calculate_total_cost == @customer_total
	end

	def send_food(customer)
		raise RangeError.new ("You have not provided an order.") if @total_cost <=0
		return customer.confirm_order if is_total_correct?
		raise RangeError.new ("You have not provided the correct amount. Sorry, no food for you.")
	end

end