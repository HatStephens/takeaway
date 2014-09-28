class Dish

	attr_accessor :name, :cost

	def initialize(details = {})
		@name = details.fetch(:name, "")
		@cost = details.fetch(:cost, 0)
	end

end