class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
