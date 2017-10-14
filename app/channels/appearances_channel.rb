class AppearancesChannel < ApplicationCable::Channel
  def subscribed
    stream_from("appearances_#{params['chat_room_id']}_channel")
  end

  def unsubscribed
    # something idk
  end

end