class Passenger < ActiveRecord::Base
	belongs_to :booking
	validates :name, presence: true 
	validates :email, presence: true 
end
