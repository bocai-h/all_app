class CommonController < ApplicationController
  layout "login"
  def index
    # render :layout => false
    @medium = Medium.all
  end

  def login
    @user_name = cookies[:user_name]
  end

  def sign_up
    @user = User.new
    # render :layout => false
  end
end
