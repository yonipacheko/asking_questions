class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    #binding.pry

    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "U're signed!, enjoy!!"
      redirect_to root_path
    else
      flash[:notice] = "Invalid password or username"
      redirect_to login_path
    end

  end

  def destroy

    session[:user_id] = nil
    flash[:notice] = "U're logged out"
    redirect_to root_path

  end
end