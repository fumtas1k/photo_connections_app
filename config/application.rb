require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PhotoConnectionsApp
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    donfig.generators do |g|
      g.assets false
      g.test_framework false
      g.skip_routes true
    end
  end
end
