class Devise::SessionsController < ApplicationController
def new
  @user=User.new
 
end
def create
     
	user=User.find_by(email: params[:email] )
	if (user.valid_password?(params[:password]))
		current_user= user
		session[:user_id]= user.id 
		current_user=user
		binding.pry
		redirect_to routes_path
	else
		#display errors with redirect to sign_in


	end


end

end