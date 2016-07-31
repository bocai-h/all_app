class Channel < ApplicationRecord
  validates_presence_of :name
  validates :person_limit, numericality: { only_integer: true }
end
