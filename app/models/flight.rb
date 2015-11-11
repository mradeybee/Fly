class Flight < ActiveRecord::Base
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings
  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :bookings
  validate :that_origin_is_not_destination
  # validates :destination, presence: true 
  # validates :no_of_passenger, presence: true
  # validates :departure_date, presence: true  

  def self.search(origin, destination)
    Flight.where(origin: origin, destination: destination)
  end

  def sort_by_date(departure_date)
  	Flight.where("strftime('%Y-%m-%d', departure_date)=?", departure_date)
  end
  private

  def that_origin_is_not_destination
    if origin == destination
      errors.add(:origin, "You can not fly to where you are, can you?")
    end
  end
end
 