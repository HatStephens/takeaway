require 'place_order'

describe PlaceOrder do

	let(:place_order){PlaceOrder.new}
	let(:line_items) {double :line_items}

	it 'should receive all line items' do
		allow(line_items).to receive(:line_item_list).and_return([:some_line_items])
		place_order.receive_line_items(line_items)
		expect(place_order.final_order.count).to eq(1)
	end

	it 'should request the total cost from the customer via the line items' do
		allow(line_items).to receive(:total_cost).and_return(0)
		expect(place_order.get_total_from_customer(line_items)).to eq(true)
	end

	it 'should check that the total cost is correct' do
		expect(place_order.is_total_correct?).to eq(true)
	end

	it 'should decide whether to confirm the order' do
		expect(place_order.send_food?).to be(true)
	end

	it 'should raise a Range Error if the total costs do not match' do
		line_items_wrong = double :line_items_wrong
		allow(line_items_wrong).to receive(:get_total_from_customer).and_return(10)
		place_order.is_total_correct?
		expect{place_order.send_food?}.to raise_error("You have not provided the correct amount. Sorry, no food for you.")
	end

end