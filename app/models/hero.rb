class Hero < ApplicationRecord
  has_many :user_heroes, class_name: 'UserHeroes'
  has_many :users, through: :user_heroes
end
