class Message < ApplicationRecord
  belongs_to :channel

  after_create_commit { AddmessageJob.perform_later(self) }
end
