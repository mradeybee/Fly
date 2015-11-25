module BookingsHelper
	def delete_all_passengers(booking_params)
  	no_dest = 0
    pas_size =  booking_params.size
    booking_params.each {|key, val| no_dest+= 1 if val["_destroy"] == "1"}
    true if no_dest == pas_size
  end
end
