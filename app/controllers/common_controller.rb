class CommonController < ApplicationController
  # layout "application", :except => [:login,:sign_up]
  def index
    # render :layout => false
  end

  def login
  end

  def sign_up
    @user = User.new
    # render :layout => false
  end
end
