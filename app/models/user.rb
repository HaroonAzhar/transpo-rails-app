class User < ApplicationRecord
	
	 # enum role: [:student, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :validatable ,:omniauthable, :omniauth_providers => [:facebook]
   belongs_to :stop
end
