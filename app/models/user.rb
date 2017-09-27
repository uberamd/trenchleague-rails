class User < ApplicationRecord
  belongs_to :team, optional: true
  has_many :admin_series, foreign_key: 'admin_user_id', class_name: 'Series'

  def get_short_steamid
    return self.steamid.to_i - 76561197960265728
  end
end
