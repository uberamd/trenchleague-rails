class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :users

  has_attached_file :logo, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>',
      medium_square: '300x300#',
      medium_stretched: '300x300!'
  }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
