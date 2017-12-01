class InhouseMatch < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'recorded_user_id', optional: true
  has_many :inhouse_match_players
  has_many :users, through: :inhouse_match_players

  has_attached_file :screenshot, styles: {
      thumb: '100x100>',
      thumb_square: '100x100#',
      tiny_square: '50x50#',
      square: '200x200#',
      medium: '300x300>',
      medium_square: '300x300#',
      medium_stretched: '300x300!'
  }

  #validates :screenshot, attachment_presence: true
  validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/
end
