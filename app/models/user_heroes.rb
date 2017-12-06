class UserHeroes < ApplicationRecord
  belongs_to :user
  belongs_to :hero
end
