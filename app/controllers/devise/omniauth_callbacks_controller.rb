class Devise::OmniauthCallbacksController  < ApplicationController
	skip_before_action :verify_authenticity_token

	def facebook
	
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
     
         u.email = auth['info']['email']
      
        end
        
 
        
        current_user=@user
     
        binding.pry
        redirect_to  routes_path
	end
	 

     def auth
      request.env['omniauth.auth']
     end

end