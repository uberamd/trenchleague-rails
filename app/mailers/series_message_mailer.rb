class SeriesMessageMailer < ApplicationMailer

  def series_message_email(user)
    @user = user
    @url = 'http://trenchleague.com/something'

    mail(to: @user.email, subject: 'TrenchLeague - Series Message')
  end
end
