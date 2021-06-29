class ApplicationController < ActionController::Base
  #Skip CSRF
  skip_before_action :verify_authenticity_token
end
