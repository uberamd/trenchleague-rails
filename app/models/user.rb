class User < ApplicationRecord
  belongs_to :team, optional: true
  has_many :admin_series, foreign_key: 'admin_user_id', class_name: 'Series'
  has_many :cast_series, foreign_key: 'caster_user_id', class_name: 'Series'

  has_many :series_messages
  has_many :notifications

  def get_short_steamid
    return self.steamid.to_i - 76561197960265728
  end
end
