require 'menu'

describe Menu do

	let(:menu){Menu.new}

	it 'should be able to receive a new dish' do
		expect{menu.add_dish(:dish)}.to change{menu.dish_list.count}.by (1)
	end

end