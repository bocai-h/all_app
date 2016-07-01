#encoding: utf-8
class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the All App!"
    else
      flash[:warning] = "注册失败!,该邮箱已经被注册"
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
