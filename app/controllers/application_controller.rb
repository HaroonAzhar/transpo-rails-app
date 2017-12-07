 
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def signedin?
  	 session[:user_id]
  end
  def current_user
  	if session[:user_id]
      @current_user = User.find_by(id: session[:user_id]) 

    else
     nil 
    end

end
def current_user= (user)
     @current_user=user
end
end
