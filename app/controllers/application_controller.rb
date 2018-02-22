 
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  rescue_from CanCan::AccessDenied do |exception|
  	exception.default_message= "You are not allowed to do that"
    redirect_to main_app.root_url, :alert => exception.message
  end


#   def signedin?
#   	 session[:user_id]
#   end
#   def current_user
#   	if session[:user_id]
#       @current_user = User.find_by(id: session[:user_id]) 

#     else
#      nil 
#     end

# end
# def current_user= (user)
#      @current_user=user
# end
end
