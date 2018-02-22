class Stop < ApplicationRecord
	has_many :users
	belongs_to :route

	validates :name, uniqueness: true
	validates :number, numericality: { only_integer: true, greater_than: 0 }
	validates :details, length: { in: 1..100 }
	validates :details, presence: true
	validates_associated :users
end
