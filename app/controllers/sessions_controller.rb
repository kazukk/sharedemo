class SessionsController < ApplicationController

def create
	auth = request.env["omiauth.auth"]
	session[:omiauth] = auth
	user = User.sign_in_from_facebook(auth)
	session[:users_id] = user.users_id
	redirected_to root_url, notice: "Signed In"
end

def destroy
session[:user_id] = nil
session[:omiauth] = nil
	redirected_to root_url, notice: "Signed Out"

end

end
