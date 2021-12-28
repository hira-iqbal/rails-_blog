class Role < ApplicationRecord
  has_many :users

  scope :default, -> { where(name: 'commenter') }
  scope :admin, -> { where(name: 'admin') }
  scope :moderator, -> { where(name: 'moderator') }
  scope :editor, -> { where(name: 'editor') }
end
