require 'customer'

describe Customer do

	let(:customer){Customer.new}

	it 'should initialize with default name' do
		expect(customer.name).to eq("Steve")
	end

	it 'should initialize with default number' do
		expect(customer.number).to eq("+447957196965")
	end

	it 'should be able to take a new name' do
		expect(customer.name="Paul").to eq("Paul")
	end

	it 'should be able to take a new number' do
		expect(customer.number="1234").to eq("1234")
	end

	it 'should be able to calculate the time' do
		expect(customer.time).to eq(Time.new.strftime("%H:%M"))
	end

	it 'should be able to send a text when confirming an order' do
		# http://www.mutuallyhuman.com/blog/2012/04/03/testing-sms-interactions-in-ruby-on-rails/
	end

end