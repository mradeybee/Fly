class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers, reject_if: 
  lambda {|attributes| attributes['name'].blank?}

end