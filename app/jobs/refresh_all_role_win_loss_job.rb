class RefreshAllRoleWinLossJob < ApplicationJob

  queue_as :default

  def perform
    users = User.all.where.not(:is_deleted => true, :is_banned => true).all

    users.each do |user|
      OpendotaRoleWinLossRefreshJob.perform_later(user)
    end

    self.class.set(wait: 24.hour).perform_later
  end
end
