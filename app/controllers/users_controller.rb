class UsersController < ApplicationController
	
	before_action :authenticate_user!
	def new
		@user=User.new
		
	end
	def create
		raise params.inspect
	end
end
