class Team < ApplicationRecord
  include RankTierHelper
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :users
  belongs_to :group, optional: true

  has_many :team_series
  has_many :series, through: :team_series
  has_many :won_matches, foreign_key: 'winning_team_id', class_name: 'SeriesMatch'
  has_many :lost_matches, foreign_key: 'losing_team_id', class_name: 'SeriesMatch'

  has_many :user_series_predictions

  has_attached_file :logo, styles: {
      thumb: '100x100>',
      thumb_square: '100x100#',
      tiny_square: '50x50#',
      square: '200x200#',
      medium: '300x300>',
      medium_square: '300x300#',
      medium_stretched: '300x300!'
  }

  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
  validates :logo, attachment_presence: true
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def get_average_rank_tier
    rank_hash = {
        :rank_tier_rolling => 0,
        :players => 0,
        :proper => 0,
        :average_normalized => 0,
        :rank_tier => { :medal => '', :stars => 0 }
    }

    team_approved_users = self.users.where(:team_join_approved => true).where.not(:rank_tier => nil).all

    if team_approved_users.count == 0
      return rank_hash
    end

    team_approved_users.each do |user|
      rank_hash[:rank_tier_rolling] += convert_proper_tier_to_normalized_rank(user.rank_tier)
      rank_hash[:players] += 1
    end

    rank_hash[:average_normalized] = (rank_hash[:rank_tier_rolling] / rank_hash[:players]).round unless rank_hash[:players] == 0
    rank_hash[:proper] = convert_normalized_rank_to_proper_tier(rank_hash[:average_normalized])

    tmp_hash = get_rank_tier_hash(rank_hash[:proper])
    rank_hash[:rank_tier][:medal] = tmp_hash['medal']['name']
    rank_hash[:rank_tier][:stars] = tmp_hash['stars']

    return rank_hash
  end

  #def get_average_mmr
  #  mmr_hash = {
  #      :solo => 0,
  #      :party => 0,
  #      :est => 0,
  #      :solo_players => 0,
  #      :party_players => 0,
  #      :est_players => 0
  #  }
  #  self.users.where(:team_join_approved => true).all.each do |user|
  #    # iterate over all of the MMR categories
  #    if !user.opendota_solo_mmr.nil?
  #      mmr_hash[:solo] += user.opendota_solo_mmr
  #      mmr_hash[:solo_players] += 1
  #    end
  #    if !user.opendota_party_mmr.nil?
  #      mmr_hash[:party] += user.opendota_party_mmr
  #      mmr_hash[:party_players] += 1
  #    end
  #    if !user.opendota_estimated_mmr.nil?
  #      mmr_hash[:est] += user.opendota_estimated_mmr
  #      mmr_hash[:est_players] += 1
  #    end
  #  end

  #  mmr_hash[:solo] = (mmr_hash[:solo] / mmr_hash[:solo_players]).round unless mmr_hash[:solo_players] == 0
  #  mmr_hash[:party] = (mmr_hash[:party] / mmr_hash[:party_players]).round unless mmr_hash[:party_players] == 0
  #  mmr_hash[:est] = (mmr_hash[:est] / mmr_hash[:est_players]).round unless mmr_hash[:est_players] == 0

  #  return mmr_hash
  #end

  def team_eligible?
    interesting_users = self.users.where(:team_join_approved => true).all

    # ensure the team has at least 5 players
    return false if interesting_users.count < 5

    # check to see if all users have been smurf checked
    interesting_users.each do |user|
      if user.smurf_check != 1
        # they have an active roster member who is not smurf approved
        return false
      end
    end

    # team is eligible
    return true
  end
end
