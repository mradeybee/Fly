class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :bookings

  def self.search(origin, destination,departure_date)
    Flight.where(origin: origin, destination: destination).where("strftime('%Y-%m-%d', departure_date)=?", departure_date)
  end

  def sort_by_date(departure_date)
  	Flight.where("strftime('%Y-%m-%d', departure_date)=?", departure_date)
  end
end
 