class FlyMail < ApplicationMailer
	default from: "adebayo.leadhire@gmail.com"

	def booking_confirmed(email, booking, current_user)
		@booking = booking
			mail(to: email, subject: 'Booking Confirmed' )		
	end
end
