class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def new
    render layout: "modal_page"
  end

  def create
  end
end
