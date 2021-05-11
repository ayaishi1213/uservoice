class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Pots.new(post_params)
    if @post.save
      render :show
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:item, :content, :image).merge(user_id: current_user.id)
  end
end
