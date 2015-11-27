class FlyMail < ApplicationMailer
	default from: "adebayo.leadhire@gmail.com"

	def booking_confirmed(user, booking, current_user)
		@booking = booking
		if current_user
			@user = user
			mail(to: @user.email, subject: 'Booking Confirmed')
		else
			user.each do |x|
				mail(to: x.email, subject: 'Booking Confirmed' )
			end			
		end
	end
end
