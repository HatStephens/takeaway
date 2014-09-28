require_relative 'line_items'
require_relative 'twilio_ruby'

class PlaceOrder
	include Twilio

	attr_reader :final_order, :check_total

	def initialize
		@final_order = []
		@total_cost = 0
		@check_total = 0
	end

	def receive_line_items(line_items)
		@final_order << line_items.line_item_list
	end

	def total_cost
		@final_order.each_with_index { |element, index| @total_cost += @final_order[index][2].to_i }
		@total_cost
	end

	def get_total_from_customer(line_items)
		@check_total == line_items.total_cost
	end

	def is_total_correct?
		@total_cost == @check_total
	end

	def send_food?
		return true if is_total_correct?
		raise RangeError.new ("You have not provided the correct amount. Sorry, no food for you.")
	end


end
