module MessagesHelper
  # generate a message notification for applicable users
  def generate_message_notification(series, message)
    notify_uids = [] # holder for user ids that we are going to alert on

    # iterate over the teams for this series
    series.teams.each do |team|
      team.users.where(team_captain: true).each do |captain|
        # start pushing recipient UIDs onto the stack
        notify_uids << captain.id if captain.id != current_user.id
      end
    end

    notify_uids.each do |uid|
      Notification.create(user_id: uid, resource_type: 'seriesmessage', resource_id: message.id )

      SeriesMessageMailer.series_message_email(User.find(uid)).deliver_later
    end
  end
end
