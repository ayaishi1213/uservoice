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
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find(params[:id])
    @likes_count = Like.where(post_id: @post.id).count
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to("/posts")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to("/posts")
  end

  private

  def post_params
    params.require(:post).permit(:item, :content, :image).merge(user_id: current_user.id)
  end
end
