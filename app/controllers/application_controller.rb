class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Basic::ControllerMethods
end
