class UserSeriesPrediction < ApplicationRecord
  belongs_to :user
  belongs_to :series
  belongs_to :team
end
