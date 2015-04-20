# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Modeldemo::Application.initialize!
ENV['RAILS_ENV'] ||= 'development'