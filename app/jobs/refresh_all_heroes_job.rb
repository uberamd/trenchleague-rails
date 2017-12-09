class RefreshAllHeroesJob < ApplicationJob

  queue_as :default

  def perform
    users = User.all.where.not(:is_deleted => true, :is_banned => true).all

    users.each do |user|
      OpendotaHeroRefreshJob.perform_later(user)
    end

    self.class.set(wait: 4.hour).perform_later
  end
end
