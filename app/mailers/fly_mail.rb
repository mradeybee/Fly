class FlyMail < ApplicationMailer
	default from: "adebayo.leadhire@gmail.com"

	def booking_confirmed(user)
		@user = user
		mail(to: @user.email, subject: 'Booking Confirmed')
	end

	def welcome(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to fly')
	end
end
