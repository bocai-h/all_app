class WelcomeChatRoomsController < ApplicationController
  def index
    respond_to do |format|
      if logined?
        format.html { redirect_to(:action => "chat_room") }
      else
        format.html
      end
    end
  end

  def chat_room_authenticate
    cookies[:user_name_key] = {value: params[:user_name_key], expires: 7.days.from_now}
    cookies[:chat_user_name] = {value: params[:chat_room][:user_name], expires: 7.days.from_now}
    respond_to do |format|
      format.html { redirect_to(:action => "chat_room") }
    end
  end

  def chat_room
    @channels = Channel.all.order("created_at DESC")
    respond_to do |format|
      if logined?
        @user_name = cookies[:chat_user_name]
        format.html
      else
        format.html { redirect_to(:action => "index") }
      end
    end
  end

  def leave_chat_room
    cookies.delete :user_name_key
    cookies.delete :chat_user_name

    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end

  private

  def logined?
    login = cookies[:user_name_key]
  end
end
