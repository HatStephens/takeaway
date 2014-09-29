require 'twilio-ruby'

class Customer

	attr_reader :time
	attr_accessor :name, :number

	def initialize(name="Steve", number="+447957196965")
		@name = name
		@number = number
		@time = Time.new.strftime("%H:%M")
	end

	def confirm_order
		@account_sid = 'AC6e98b176fc4454a9529932dba8b0c092'
		@auth_token = '94c56b54f1e0dcd0653f386dcefa5fc8'
		@client = Twilio::REST::Client.new @account_sid, @auth_token
		@client.messages.create(
		  from: '+441749200123',
		  to: @number,
		  body: "Thank you #{@name} for your order. It will be delivered before #{@time.hour+1}:#{@time.strftime("%M")}"
		)
	end

end