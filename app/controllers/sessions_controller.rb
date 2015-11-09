class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth.expect('extra')
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		flash[:notice] = "Signed In"
		redirect_to root_path
	end

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		flash[:notice] = "Signed Out"
		redirect_to root_path
	end
end
