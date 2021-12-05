class Role < ApplicationRecord
  has_many :users

  scope :default, -> { where(name: 'commenter') }
  scope :admin, -> { where(name: 'admin') }
end
