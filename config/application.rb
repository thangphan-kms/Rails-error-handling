require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Load dotenv only in development or test environment
if ['development', 'test'].include? ENV['RAILS_ENV']
  Dotenv::Railtie.load
end

module Elasticsearch
  class Application < Rails::Application
    config.load_defaults 7.1

    # Load some modules
    config.eager_load_paths << Rails.root.join('lib')

    # Handling 405 and 500 page on our own
    config.exceptions_app = self.routes
  end
end
