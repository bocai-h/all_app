require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AllApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # 导出的模式文件是ruby格式的
    config.active_record.schema_format
    # 设置Rails，让其在生产环境中服务于静态资源
    config.public_file_server.enabled = true

    #设置自己的静态资源路径
    # config.assets.paths << File.join(Rails.root, 'app', 'assets', 'images','logo')
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.compress = true
    #在config/application.rb 文件中加入以下代码可以禁止生成控制器相关的静态资源：
    config.generators do |g|
      g.test_framework nil
    end

    # config.autoload_paths += %W( #{config.root}/lib/fwk)
    config.autoload_paths += %W(#{config.root}/lib)
    # config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # 这一句应该写在ActiveRecord::Base里面的  但是由于这些是gem包不会被git跟踪  因此并非最好的方式
    # include Fwk::CustomId
    #强制使用ssl(https)
    # config.force_ssl = true

    # 关闭action_cable的跨域检查
    config.action_cable.disable_request_forgery_protection = true
    # config.action_cable.allowed_request_origins = ['http://rubyonrails.com', /http:\/\/ruby.*/]
  end
end
