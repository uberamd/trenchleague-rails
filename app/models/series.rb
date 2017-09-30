class Series < ApplicationRecord
  has_many :team_series
  has_many :teams, through: :team_series
  has_many :series_messages
  has_many :series_matches

  belongs_to :admin, class_name: 'User', foreign_key: 'admin_user_id', optional: true
  belongs_to :caster, class_name: 'User', foreign_key: 'caster_user_id', optional: true

  # lets us know if the series has been confirmed
  def confirmed?
    if self.team_series[0].team_approved_date && self.team_series[1].team_approved_date
      return true
    end

    return false
  end

  def has_admin?
    if self.admin_user_id
      return true
    end

    return false
  end

  def has_caster?
    if self.caster_user_id
      return true
    end

    return false
  end
end
