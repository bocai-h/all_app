# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 订阅对应房间
    binding.pry
    stream_from "room_channel_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    channel = Channel.find(data['room'].to_i)
    message = channel.messages.build(content: data['message'],author: data['user_name'])
    message.save
  end
end
