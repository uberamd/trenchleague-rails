class Series < ApplicationRecord
  has_many :team_series
  has_many :teams, through: :team_series

  belongs_to :admin, class_name: 'User', foreign_key: 'admin_user_id'
end
