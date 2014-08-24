class SessionsController < ApplicationController
	def login
		user = User.find_by(username: params[:username])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to posts_url
	  else
	    flash.notice = "Invalid username or password"
      redirect_to posts_url
	  end
	end

	def logout
		session[:user_id]=nil
		redirect_to posts_url
	end

end
