require 'place_order'

describe PlaceOrder do

	let(:place_order) {PlaceOrder.new(line_items)}
	let(:line_items) {double :line_items, line_item_list: :some_line_items}
	let(:customer) {double :customer}

	it 'should receive all line items' do
		# allow(line_items).to receive(:line_item_list).and_return([:some_line_items])
		allow(line_items).to receive(:total_cost_from_customer).and_return(0)
		expect(place_order.final_order.count).to eq(1)
	end

	it 'should calculate the total cost' do
		expect(line_items).to receive(:total_cost_from_customer)
		place_order.calculate_total_cost
	end

	it "should return the valie of the total cost from the customer" do
		allow(line_items).to receive(:total_cost_from_customer).and_return(15)
		expect(place_order.calculate_total_cost).to eq 15
	end

	it 'should request the total cost from the customer via the line items' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(20)
		expect(place_order.get_total_from_customer(line_items)).to eq(20)
	end

	it 'should check that the total cost is correct' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(0)
		expect(place_order.is_total_correct?).to eq(true)
	end

	it 'should decide whether to confirm the order' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(20)
		place_order.total_cost=20
		allow(customer).to receive(:confirm_order).and_return(true)
		expect(place_order.send_food(customer)).to be(true)
	end

	it 'should raise a Range Error if the total costs is zero' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(20)
		expect{place_order.send_food(customer)}.to raise_error("You have not provided an order.")
	end

	it 'should raise a Range Error if the total costs do not match' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(10)
		place_order.get_total_from_customer(line_items)
		place_order.total_cost=5
		expect{place_order.send_food(customer)}.to raise_error("You have not provided the correct amount. Sorry, no food for you.")
	end

	it 'should send a text if it decides to send the food' do
		allow(line_items).to receive(:total_cost_from_customer).and_return(10)
		place_order.get_total_from_customer(line_items)
		place_order.total_cost=10
		allow(customer).to receive(:confirm_order).and_return(true)
		expect(place_order.send_food(customer)).to be true
	end

end