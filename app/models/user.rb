class User < ApplicationRecord
  include RankTierHelper

  belongs_to :team, optional: true
  has_many :admin_series, foreign_key: 'admin_user_id', class_name: 'Series'
  has_many :cast_series, foreign_key: 'caster_user_id', class_name: 'Series'
  has_many :inhouse_recorded_matches, foreign_key: 'recorded_user_id', class_name: 'InhouseMatch'

  has_many :generic_uploads

  has_many :series_messages
  has_many :notifications

  has_many :inhouse_match_players
  has_many :inhouse_matches, through: :inhouse_match_players

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  belongs_to :inhouse_lobby, class_name: 'ChatRoom', foreign_key: 'chat_room_id', optional: true

  has_many :user_series_predictions

  has_many :faq_questions, foreign_key: 'asked_by_user_id', class_name: 'Faq'
  has_many :faq_answers, foreign_key: 'answered_by_user_id', class_name: 'Faq'

  has_many :user_heroes, class_name: 'UserHeroes'
  has_many :heroes, through: :user_heroes

  def get_short_steamid
    return self.steamid.to_i - 76561197960265728
  end

  def rank_tier_hash
    if self.rank_tier.nil?
      return false
    end

    return get_rank_tier_hash(self.rank_tier)
  end

  def rank_tier_name
    if self.rank_tier.nil?
      return nil
    end

    tmp_hash = self.rank_tier_hash

    return tmp_hash['medal']['name']
  end

  def rank_tier_stars
    if self.rank_tier.nil?
      return nil
    end

    return self.rank_tier_hash['stars']
  end
end
