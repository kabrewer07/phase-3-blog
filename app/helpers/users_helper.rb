module UsersHelper
	def user_params
	  params.permit(:username, :password)
	end

	def current_user 
		User.find(session[:user_id]) if session[:user_id]
	end
end
