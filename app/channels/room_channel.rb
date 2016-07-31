# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(comment)
    ActionCable.server.broadcast "room:#{params[:id]}:comments", comment: data["comment"]
  end

  def follow(data)
    stop_all_streams
    stream_from "room:#{data['room_id']}:comments"
  end
end