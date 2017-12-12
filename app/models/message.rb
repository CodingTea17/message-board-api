class Message < ApplicationRecord
  belongs_to :group


  scope :time_at, -> (time) { where("created_at <= ?", Time.zone.parse(time)) }
end
