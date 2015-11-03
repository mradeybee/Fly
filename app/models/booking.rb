class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
  has_many :passengers

  validates :no_of_passengers, numericality: { only_integers: true }, lenght: { greater_than: 0 }, message: "You must have at least one passenger"
end