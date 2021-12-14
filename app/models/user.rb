class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  after_initialize :default_role

  private

  def default_role
    if self.role.blank?
      if Role.default.any?
        self.role = Role.default.first
      end
    end
  end
end
