class Article < ApplicationRecord
  include Visible

  has_many_attached :images
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :archived, -> { where.not(status: 'archived') }
  scope :public_article, -> { where(status: 'Public') }
  scope :private_article, -> { where(status: 'Private') }
  scope :ordered, -> { order(updated_at: :desc) }
end

