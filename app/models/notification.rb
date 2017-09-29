class Notification < ApplicationRecord
  validates :user_id, :resource_type, :resource_id, presence: true

  belongs_to :user
end
