class CommentsController < ApplicationController

  def index 
  end 

  def show 
    @comment = Comment.find(params[:id])
  end 

end
