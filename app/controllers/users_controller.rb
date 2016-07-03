#encoding: utf-8
class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the All App!"
    else
      errors = @user.errors.values.flatten
      # 删除has_secure_password的提示消息
      errors.delete("can't be blank")
      flash[:warning] = "注册失败:" + errors.join(" ")
    end
  end

  def show
  end

  # 验证邮箱是否已经被注册
  def validate_email_avaiable
    user = User.find_by_email(params[:email])
    if user.present?
     render json: "false"
    else
      render json: "true"
    end
  end

  private
  def user_params
    params.require(:user).permit(:nick_name,:email,:password,:password_confirmation)
  end
end
