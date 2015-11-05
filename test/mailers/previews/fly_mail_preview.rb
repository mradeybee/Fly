# Preview all emails at http://localhost:3000/rails/mailers/fly_mail
class FlyMailPreview < ActionMailer::Preview
	def fly_mail_preview
		FlyMail.booking_confirmed(User.first)
	end
end
