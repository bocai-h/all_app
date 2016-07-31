class ChatMessagesController < ApplicationController
  layout "modal_page",only: [:index]
  def index
    @channel = Channel.find(params[:id])
  end

  def create
    binding.pry
  end
end
