class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if session[:current_user_id] != params[:id].to_i
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end


  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :password, :password_confirmation)
  end

end
