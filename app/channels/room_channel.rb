# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 订阅对应房间
    # puts "========================subscribed---#{params[:room]}--===================="
    # if params[:room].present?
    #   # stream_from "room_channel_#{params[:room]}"
    #   stream_from "room_channel"
    # end
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    # channel = Channel.find(data['room'].to_i)
    # message = channel.messages.build(content: data['message'],author: data['user_name'])
    # message.save

    # 消息不存数据库
    channel = Channel.find(data['room'].to_i)
    message = channel.messages.build(content: data['message'],author: data['user_name'])
    message.created_at = Time.now
    ActionCable.server.broadcast  "room_channel", message: render_message(message)
  end

  private
   def render_message(message)
     ApplicationController.renderer.render(partial: 'chat_messages/message_list', locals: { message: message })
   end
end
