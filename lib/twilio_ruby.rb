require 'twilio-ruby'

module Twilio

	account_sid = 'AC6e98b176fc4454a9529932dba8b0c092'
	auth_token = '94c56b54f1e0dcd0653f386dcefa5fc8'

	attr_reader :client

	def initialize
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

end