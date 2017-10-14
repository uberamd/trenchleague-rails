class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chat_room_id = params['chat_room_id']
    current_user.save!
    AppearanceBroadcastJob.perform_later(params['chat_room_id']) unless params['chat_room_id'].nil?

    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.chat_room_id = nil
    current_user.save!

    AppearanceBroadcastJob.perform_later(params['chat_room_id']) unless params['chat_room_id'].nil?
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end