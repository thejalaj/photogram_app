class ChatRoom < ApplicationRecord
   has_many :chat_rooms_users
   has_many :messages, dependent: :destroy
end
