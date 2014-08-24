class UsersController < ApplicationController
	include UsersHelper

	def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
	    redirect_to posts_url
	  else
	    render 'new'
	  end
  end
end
