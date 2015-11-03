class Passenger < ActiveRecord::Base
	belongs_to :user
	has_many :bookings
	has_many :flights, through: :bookings

	validates :name, :email, presence: true
end
