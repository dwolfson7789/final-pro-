require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FinalBackend
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '/cors', :headers => :any, :methods => [:post, :put]
        resource '*', :headers => :any, :methods => [:get, :post, :put, :options]
      end
    end
  end
end
