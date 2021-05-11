class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿が完了しました"
      render_to("/posts/index")
    else
      render("posts/new")
    end
  end

  private

  def post_params
    params.require(:post).permit(:item, :content, :image).merge(user_id: current_user.id)
  end
end
