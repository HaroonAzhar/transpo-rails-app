class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	 # enum role: [:student, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :validatable ,:omniauthable, :omniauth_providers => [:facebook]
   belongs_to :stop

   validates :username,:email,:role, presence: true
   validates :email, format: { with: /\A\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+\z/,message: "special character are not allowed" } 
   validates :username, format: { with: /[a-zA-Z0-9]/,message: "only allows letters and numbers" }
   validates :username, :email, uniqueness: true
end
