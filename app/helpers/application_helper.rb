module ApplicationHelper

  include Pagy::Frontend
  def status_options
    Article::STATUSES.map {|e|[e.camelize, e.downcase]}
  end
end
