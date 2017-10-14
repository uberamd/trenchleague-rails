class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, class_name: 'User', foreign_key: 'chat_room_id'
end
