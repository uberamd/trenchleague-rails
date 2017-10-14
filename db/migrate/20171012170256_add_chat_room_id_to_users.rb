class AddChatRoomIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :chat_room_id, :integer
  end
end
