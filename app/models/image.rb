class Image < ApplicationRecord
  #Image is your model
  acts_as_votable
  belongs_to :user
  validates :user, presence: true
  validates :file, presence: true
  validates :caption, presence: true
  has_attached_file :file, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", original: "250x250#"}
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
