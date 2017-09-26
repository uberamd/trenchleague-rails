class ScheduledMatch < ApplicationRecord

  belongs_to :team_1_id, class_name: 'Team'
  belongs_to :team_2_id, class_name: 'Team'
  belongs_to :team_1_user_id, class_name: 'User'
  belongs_to :team_2_user_id, class_name: 'User'
end
