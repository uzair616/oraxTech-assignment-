class UsersController < ApplicationController
skip_before_action :require_user, only: [:new,:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name} you are signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end
