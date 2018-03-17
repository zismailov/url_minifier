require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UrlMinifier
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = "UTC"
    config.active_record.default_timezone = :utc

    config.generators do |g|
      g.template_engine :slim
      g.test_framework :rspec,
        view_specs:    false,
        request_specs: false,
        routing_specs: false,
        helper_specs:  false
    end

    config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }
  end
end
