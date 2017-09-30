class SeriesMatch < ApplicationRecord
  belongs_to :series
  belongs_to :winner, class_name: 'Team', foreign_key: 'winning_team_id', optional: true
  belongs_to :loser, class_name: 'Team', foreign_key: 'losing_team_id', optional: true
end
