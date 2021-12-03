class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :archived, -> { where(status: 'archived') }
  scope :ordered, -> { order(updated_at: :desc) }
end

