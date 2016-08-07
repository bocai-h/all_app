class ChatMessagesController < ApplicationController
  layout "modal_page",only: [:index]
  def index
    @channel = Channel.find(params[:id])
    @messages = @channel.messages.order("created_at DESC")
  end
end
