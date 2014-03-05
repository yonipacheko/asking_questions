class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(resolving_params)
    if @user.save
      flash[:notice] = "Now you'are registerd, please log in!"
      redirect_to login_path
    else
      render :new
    end

  end

  private

  def resolving_params
    params.require(:user).permit!
  end
end