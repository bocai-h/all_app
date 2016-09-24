#encoding: utf-8
class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # 注册成功 设置为登录状态
        sign_in @user
        flash[:success] = "注册成功,欢迎#{@user.nick_name}"
        format.html { redirect_to root_path }
      else
        flash.now[:warning] = "注册失败"
        format.html { render "common/sign_up" }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # 验证邮箱是否已经被注册
  def validate_email_avaiable
    user = User.find_by_email(params[:email])
    if user.present?
     render json: {:result => "exist"}
    else
      email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if email_format !~ params[:email]
        # 如果格式不匹配
        render json: {:result => "wrong_format"}
      else
        render json: {:result => "true"}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:nick_name,:email,:password,:password_confirmation)
  end
end
