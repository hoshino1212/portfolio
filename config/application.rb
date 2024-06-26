require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapp
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

    # Webpacker configuration
    config.webpacker.check_yarn_integrity = false
    config.webpacker.compile = false

    # Add the time zone configuration here
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    
    config.hosts << "portfolio-o9vb.onrender.com"
  end
end
