class UsersController < ApplicationController
	skip_before_action  :verify_authenticity_token
	before_action :authenticate_user!
	def omniCreate
		raise params.inspect
		
	end
	def omniForm
		
	end

	def update
		raise params.inspect
	end
end
