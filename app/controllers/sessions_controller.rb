#encoding: utf-8
class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
     #登录成功
     sign_in @user
    else
     #登录失败
      @error = "登录失败:用户名或密码错误"
    end
  end

  def destroy
    sign_out
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
