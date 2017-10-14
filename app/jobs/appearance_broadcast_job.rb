class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room)
    users = User.where(:chat_room_id => room)
    ActionCable.server.broadcast "appearances_#{room}_channel", render_users(users)
  end

  private

  def render_users(users)
    ApplicationController.renderer.render(partial: 'in_house/active_users', locals: { users: users })
  end

end