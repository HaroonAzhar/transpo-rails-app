class Devise::OmniauthCallbacksController  < ApplicationController
	skip_before_action :verify_authenticity_token

	def facebook
	
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
     
         u.email = auth['info']['email']
      
        end
        
 
        
        current_user=@user
     
        binding.pry
        redirect_to  users_omniForm_path
	end
	 def passthru
       render status: 404, plain: "Not found. Authentication passthru."
     end

     def auth
      request.env['omniauth.auth']
     end

end