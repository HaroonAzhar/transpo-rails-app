class Route < ApplicationRecord
	
	has_many :stops
	has_many :users, through: :stops

	validates :number, numericality: { only_integer: true, greater_than: 0 }
	validates_associated :stops
end
