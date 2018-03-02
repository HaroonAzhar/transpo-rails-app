class Devise::RegistrationsController < DeviseController
 

    def create
        
        
        @user=User.new
        @user.email=params[:user][:email]
        @user.password=params[:user][:password]
        @user.stop=Stop.find_by(id: params[:user][:stop_id])
        @user.role= params[:user][:role]
        @user.username=params[:user][:username]
        if @user.role="admin"
          @user.save(validate: false)
        else
          @user.save!
        end
       redirect_to new_user_session_path

       


    	
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

    



end	