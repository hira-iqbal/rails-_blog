module Visible
  extend ActiveSupport::Concern

  STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: STATUSES }
  end

  def archived?
    status == 'archived'
  end
end
