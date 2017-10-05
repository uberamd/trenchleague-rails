class GenericUpload < ApplicationRecord

  has_attached_file :image, styles: {
      thumb: '100x100>',
      thumb_square: '100x100#',
      tiny_square: '50x50#',
      square: '200x200#',
      medium: '300x300>',
      medium_square: '300x300#',
      medium_stretched: '300x300!',
      large: '600x600>',
      large_square: '600x600#',
      large_stretched: '600x600!'
  }

  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end
