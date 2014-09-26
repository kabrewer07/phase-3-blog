class PostsController < ApplicationController
  include PostsHelper

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.order("created_at DESC")
    end
    @post = Post.new
  end

  def new
    @post = Post.new 
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      if request.xhr?
        render partial: "post", locals: {post: @post}, layout: false
      else
       redirect_to post_path(@post)
      end
    else
      render 'new'
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash.notice = "Post '#{@post.title}' Updated!"
    redirect_to posts_path
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end
end