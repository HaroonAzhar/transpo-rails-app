class Devise::SessionsController < ApplicationController

def new
  @user=User.new
end
def create
     
	@user=User.find_by(email: params[:email] )
	if (@user.valid_password?(params[:password]))
		current_user= @user
		session[:user_id]= @user.id 
		redirect_to routes_path
	else
		#throw error and check
	end

end
def destroy
	current_user=nil
	session[:user_id]=nil
	
end

end