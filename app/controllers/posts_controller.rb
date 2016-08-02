class PostsController < ApplicationController
  def index 
    @posts = Post.all 
  end

  def show 
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else 
      'Edit'
    end
  end

  def destroy
  end

  private 

    def post_params
      params.require(:post).permit(:description, :avatar)
    end
  
end
