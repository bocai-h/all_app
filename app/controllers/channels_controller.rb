class ChannelsController < ApplicationController
  def new
    @channel = Channel.new
    render layout: "modal_page"
  end

  def create
    @channel = Channel.new(channel_params)
    respond_to do |format|
      if @channel.save
         format.html { redirect_to chat_room_path }
      else
        format.html { render "new" }
      end
    end
  end

  private
    def channel_params
      params.require(:channel).permit(:name, :description,:person_limit)
    end
end
