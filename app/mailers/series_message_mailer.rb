class SeriesMessageMailer < ApplicationMailer

  def series_message_email(user, series, message)
    @user = user
    @url  = "http://trenchleague.com/series/#{series.id}#message-#{message.id}"
    @message = message

    mail(to: @user.email, subject: 'TrenchLeague - New Message Posted')
  end
end
