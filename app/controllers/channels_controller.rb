class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
    render layout: "modal_page"
  end

  def create
    binding.pry
  end
end
