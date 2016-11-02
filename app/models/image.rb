class Image < ApplicationRecord
  belongs_to :user
  # validates :file, :attachment_presence => true
  has_attached_file :file, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", original: "250x250#"}
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_content_type :image, :presence => true
  # do_not_validate_attachment_file_type :file
end

# function Image() {
#    this.belongs_to = user;
#  }
#
