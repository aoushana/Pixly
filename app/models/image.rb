class Image < ApplicationRecord
  #Image is your model
  before_validation { image.clear if @delete_image }
  acts_as_votable
  belongs_to :user
  validates :user, presence: true
  validates :file, presence: true
  validates :caption, presence: true
  has_attached_file :file, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", original: "250x250#"}
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by
      ]
  )
  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  scope :sorted_by, lambda { |sort_key|
          #sorts students by sort_key
          }
end
# This method provides select options for the `sorted_by` filter select input.
# It is called in the controller as part of `initialize_filterrific`.

# function Image() {
#    this.belongs_to = user;
#  }
#
