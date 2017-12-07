class Devise::OmniauthCallbacksController  < ApplicationController


	def facebook
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      
    end
 
    session[:user_id] = @user.id
    current_user=@user
     binding.pry
 
    redirect_to  user_registration_path 
	end
	 def passthru
       render status: 404, plain: "Not found. Authentication passthru."
     end

end