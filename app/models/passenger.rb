class Passenger < ActiveRecord::Base
	belongs_to :bookings
end
