class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :age, :email, :profile)
  end

end

