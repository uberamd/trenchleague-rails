class Faq < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'asked_by_user_id', optional: true
  belongs_to :answerer, class_name: 'User', foreign_key: 'answered_by_user_id', optional: true

  validates :question, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 200 }
end
