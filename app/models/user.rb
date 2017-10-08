class User < ApplicationRecord
  belongs_to :team, optional: true
  has_many :admin_series, foreign_key: 'admin_user_id', class_name: 'Series'
  has_many :cast_series, foreign_key: 'caster_user_id', class_name: 'Series'
  has_many :inhouse_recorded_matches, foreign_key: 'recorded_user_id', class_name: 'InhouseMatch'

  has_many :generic_uploads

  has_many :series_messages
  has_many :notifications

  has_many :inhouse_match_players
  has_many :inhouse_matches, through: :inhouse_match_players

  def get_short_steamid
    return self.steamid.to_i - 76561197960265728
  end
end
