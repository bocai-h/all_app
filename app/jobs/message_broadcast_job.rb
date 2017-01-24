class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{message.channel.id}", message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'chat_messages/message_list', locals: { message: message })
  end
end
