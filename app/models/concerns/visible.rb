module Visible
  extend ActiveSupport::Concern

  STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: STATUSES }, allow_blank: true
  end

  def archived?
    status == 'archived'
  end
end
