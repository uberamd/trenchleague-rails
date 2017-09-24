class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :users

  has_attached_file :logo, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>',
      medium_square: '300x300#',
      medium_stretched: '300x300!'
  }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  def get_average_mmr
    mmr_hash = {
        :solo => 0,
        :party => 0,
        :est => 0,
        :solo_players => 0,
        :party_players => 0,
        :est_players => 0
    }
    self.users.where(:team_join_approved => true).all.each do |user|
      # iterate over all of the MMR categories
      if !user.opendota_solo_mmr.nil?
        mmr_hash[:solo] += user.opendota_solo_mmr
        mmr_hash[:solo_players] += 1
      end
      if !user.opendota_party_mmr.nil?
        mmr_hash[:party] += user.opendota_party_mmr
        mmr_hash[:party_players] += 1
      end
      if !user.opendota_estimated_mmr.nil?
        mmr_hash[:est] += user.opendota_estimated_mmr
        mmr_hash[:est_players] += 1
      end
    end

    mmr_hash[:solo] = (mmr_hash[:solo] / mmr_hash[:solo_players]).round
    mmr_hash[:party] = (mmr_hash[:party] / mmr_hash[:party_players]).round
    mmr_hash[:est] = (mmr_hash[:est] / mmr_hash[:est_players]).round

    return mmr_hash
  end
end
