require File.expand_path('../boot', __FILE__)

# require 'rails/all'
require 'action_controller/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Releasethekraken
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.autoload_paths << Rails.root.join('lib')
  end
end
