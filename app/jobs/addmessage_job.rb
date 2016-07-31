class AddmessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "room:#{message.channel_id}:comments", comment: message.content
  end
end
