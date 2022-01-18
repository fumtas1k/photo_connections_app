require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PhotoConnectionsApp
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.assets false
      g.skip_routes true
    end
  end
end
