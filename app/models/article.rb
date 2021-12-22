class Article < ApplicationRecord
  include Visible

  has_many_attached :images

  has_many :comments, dependent: :destroy

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :not_archived, -> { where.not(status: 'archived') }
  scope :_public, -> { where("LOWER(status) ?", "public") }
  scope :_private, -> { where("LOWER(status) ?", "private") }
  scope :ordered, -> { order(updated_at: :desc) }
end
