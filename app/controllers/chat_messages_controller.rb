class ChatMessagesController < ApplicationController
  layout "modal_page",only: [:index]
  def index
    @channel = Channel.find(params[:id])
    @messages = @channel.messages
  end

  def create
    @channel = Channel.find(params[:message][:channel_id])
    @comment = Message.create! content: params[:message][:content], channel: @channel, author: cookies[:chat_user_name]
  end
end
