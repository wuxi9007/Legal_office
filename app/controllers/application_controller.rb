class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with :name => "#{ENV['SITE_NAME']}", :password => "#{ENV['SITE_PASSWORD']}"
end
