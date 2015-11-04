class Booking < ActiveRecord::Base
  has_many :passengers
  accepts_nested_attributes_for :passengers, reject_if: 
  lambda {|attributes| attributes['name'].blank?}
end