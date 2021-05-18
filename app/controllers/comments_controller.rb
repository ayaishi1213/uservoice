class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.build(comment_params)
    
    if @comment_content.save
      render :index
    end
  end
end
