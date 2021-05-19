class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]

  def show
    # @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)

    # if params[:image]
    #   @user.image_name = "#{@user.id}.jpg"
    #   image = params[:image]
    #   File.binwrite("public/#{@user.image_name}", image.read)
    # end

    if @user.save
      redirect_to user_path(@user.id)
    else
      render("/users/edit")
    end

    def likes
      @user = User.find_by(id: params[:id])
      @likes = Like.where(user_id: @user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :age, :email, :profile)
  end

  def set_params
    @post = Post.find(params[:id])
  end

end

