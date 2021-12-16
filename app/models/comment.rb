class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
end
