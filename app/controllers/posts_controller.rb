class PostsController < ApplicationController
	include PostsHelper

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
  	if session[:user_id] 
  		@post = Post.new 
  	else
  		redirect_to posts_url
  	end
  end

  def create 
  	# fail
  	if session[:user_id] 
	  	@post = Post.new(post_params)
	  	if @post.save
		    redirect_to post_path(@post)
		  else
		    render 'new'
		  end
		else
			redirect_to posts_url
		end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_url
  end

  def edit 
  	# do I need to put in checkers everywhere for logged in user?
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(post_params)
  	flash.notice = "Post '#{@post.title}' Updated!"
  	redirect_to post_path(@post)
  end
end