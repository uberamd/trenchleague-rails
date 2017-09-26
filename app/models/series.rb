class Series < ApplicationRecord
  has_many :team_series
  has_many :teams, through: :team_series
end
