class ChatMessagesController < ApplicationController
  layout "modal_page",only: [:index]
  def index
    @channel = Channel.find(params[:id])
    @new_massage = @channel.messages.build
    @messages = @channel.messages
  end

  def create
    @channel = Channel.find(params[:message][:channel_id])
    @comment = Message.create! content: params[:message][:content], channel: @channel, author: cookies[:user_name]
  end
end
