class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :origin, :destination, presence: true, on: :search

  def self.search(origin, destination)
    Flight.where(origin: origin, destination: destination)
  end

  def sort_by_date(departure_date)
  	Flight.where("strftime('%Y-%m-%d', :departure_date)=?", departure_date)
  end
end
 