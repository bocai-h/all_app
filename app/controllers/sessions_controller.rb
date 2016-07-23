#encoding: utf-8
class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        #登录成功
        sign_in @user
        if params[:remember_me] == "1"
          remember_me @user.email
        end
        flash[:success] = "登录成功,欢迎#{@user.nick_name}"
        format.html { redirect_to root_path }
      else
        #登录失败
        flash[:warning] = "登录失败,用户名或密码错误"
        format.html { redirect_to sign_in_path }
      end
    end
  end

  def destroy
    sign_out
    respond_to do |format|
      flash[:success] = "已注销"
      format.html { redirect_to root_path }
    end
  end
end
