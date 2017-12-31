class Devise::RegistrationsController < ApplicationController

    def create
        
        
       @user=User.create(user_params)
       # @user.email=params[:user][:email]
       # @user.password=params[:user][:password]
       #  binding.pry

       # stop= Stop.find_by(id: params[:stop][:stop_id])
       # @user.stop=stop 
       @user.role= params[:user][:role]
       @user.save!
       binding.pry
       redirect_to new_user_session_path

       #@user.role= params[:role]

        # @user=User.new(user_params)
        

        # @user.save!
        # binding.pry


    	
    end
    def edit
    	@user=current_user
    	render 'users/edit'
    	
    end
	def update
		
	end
    def new
        @user=User.new
    end

    def user_params(*args)
         params.require(:user).permit(:email, :password,:stop_id, :role )
     end


end	