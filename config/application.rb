require_relative 'boot'

# require 'rails/all'
require 'rails'
require 'action_cable'
# This list is here as documentation only - it's not used
# omitted = %w(
#   active_storage/engine
#   action_cable/engine
#   action_mailbox/engine
#   action_text/engine
# )

# Only the frameworks in Rails that do not pollute our routes
%w[
  active_storage/engine
  active_record/railtie
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  rails/test_unit/railtie
  sprockets/railtie
].each do |railtie|
  require railtie
rescue LoadError
  # Ignored
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

HOSTNAME = ENV['HOSTNAME']

module QuickNotifier
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.active_storage.draw_routes = false

    console do
      ActiveRecord::Base.connection
    end
  end
end

# config/database.rb