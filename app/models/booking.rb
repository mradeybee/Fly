class Booking < ActiveRecord::Base
	include AddCode
	before_create :add_code
	belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers, 
  reject_if: lambda {|attributes| attributes['name'].blank?}, :allow_destroy => true 



   def add_code
     raw = [('A'..'Z'),(0..9)].map { |i| i.to_a }.flatten
     self.code = (0...20).map { raw[rand(raw.length)] }.join
   end
end