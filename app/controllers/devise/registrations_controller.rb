class Devise::RegistrationsController < ApplicationController
    def edit
    	@user=current_user
    	render 'users/edit'
    	
    end
	def update
		
	end


end	