require 'dish'

describe Dish do

	let(:dish){Dish.new(name: "Lamb Burger" , cost: 8)}
	let(:new_dish){Dish.new}

	it 'should be able to initialize with a name' do
		expect(dish.name).to eq("Lamb Burger")
	end

	it 'should be able to initialize with a cost' do
		expect(dish.cost).to eq(8)
	end

	it 'should be able to receive a name' do
		new_dish.name="Salad"
		expect(new_dish.name).to eq("Salad")
	end

	it 'should be able to receive a cost' do
		new_dish.cost=5
		expect(new_dish.cost).to eq(5)
	end
end