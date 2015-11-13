class FlyMail < ApplicationMailer
	default from: "adebayo.leadhire@gmail.com"

	def booking_confirmed(user, booking)
		@user = user
		@booking = booking
		mail(to: @user.email, subject: 'Booking Confirmed')
	end
end
