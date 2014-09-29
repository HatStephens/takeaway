require 'line_items'

describe LineItem do

	let(:line_item){LineItem.new}
	let(:dish){double :dish, name: "Kebab", cost: 10}

	it 'should be able to receive a dish and quantity' do
		line_item.add_order(dish, 3)
		expect(line_item.line_item_list.count).to eq(1)
	end

	it 'should request the total cost from customer' do
		line_item.request_total_cost=(30)
		expect(line_item.total_cost_from_customer).to eq(30)
	end

end