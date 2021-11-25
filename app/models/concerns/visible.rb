module Visible
  extend ActiveSupport::Concern

  valid_statuses = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: valid_statuses }
  end

  def archived?
    status == 'archived'
  end
end
