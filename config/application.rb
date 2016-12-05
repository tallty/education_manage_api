require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnlineTrain
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    ############# 二级路由 ################
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    #############################

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # export excel
    config.gem 'spreadsheet'

    ################ Rack::Cors ########################
    config.middleware.insert_before 0, Rack::Cors, :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head],
          :max_age => 0
      end
    end
    #####################################################

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-CN'
    config.encoding = 'utf-8'

    config.gem 'spreadsheet'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    ################ngin #########
    # config.action_controller.asset_host = 'http://114.55.172.35/trains/'
    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.action_controller.asset_host = 'http://114.55.172.35'
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.relative_url_root = "/trains"
    config.action_controller.relative_url_root = "/trains"

    ##########################

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/**/)
  end
end
