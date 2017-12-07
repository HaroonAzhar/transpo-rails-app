class Devise::SessionsController < ApplicationController

  def createWithOmni
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      
    end
 
    session[:user_id] = @user.id
    current_user=@user

 
    redirect_to  user_registration_path 
  end

  def startOmni
    
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end