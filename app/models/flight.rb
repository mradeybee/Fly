class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :bookings

 def self.search(origin, destination, departure_date)
  Flight.where("origin_id = ? AND destination_id = ? AND date(departure_date) = ?", origin, destination, departure_date)
end
end