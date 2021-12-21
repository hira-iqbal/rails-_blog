module ApplicationHelper

  def status_options
    Article::STATUSES.map {|e|[e.camelize, e.downcase]}
  end
end
