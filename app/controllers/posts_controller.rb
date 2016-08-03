class PostsController < ApplicationController

  before_action :post_find, only: [:show, :edit, :update]

  def index 
    @posts = Post.all 
  end

  def show 
  end

  def new 
    @post = Post.new 
  end 

  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post Created!"
    else 
      render :new, alert: "Error Creating Post!"
    end
  end

  def edit 
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else 
      'Edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_url 
  end

  private 

    def post_find
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:description, :avatar, :user_id)
    end
  
end
