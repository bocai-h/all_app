class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    @user.user_name = @user.last_name + @user.first_name
    if @user.save
      flash[:success] = "Welcome to the All App!"
      sign_in @user
      redirect_to @user
    else
      render 'common/sign_up'
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name,:email_address)
  end
end
