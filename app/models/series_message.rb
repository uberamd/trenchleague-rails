class SeriesMessage < ApplicationRecord
  belongs_to :series
  belongs_to :user
end
