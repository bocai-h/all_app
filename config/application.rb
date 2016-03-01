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

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # 导出的模式文件是ruby格式的
    config.active_record.schema_format
    # 设置Rails，让其在生产环境中服务于静态资源
    config.serve_static_assets = true
    #设置自己的静态资源路径
    # config.assets.paths << File.join(Rails.root, 'app', 'assets', 'images','logo')
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.compress = true
    #在config/application.rb 文件中加入以下代码可以禁止生成控制器相关的静态资源：
    config.generators do |g|
      g.assets false
    end

    # config/application.rb
    # config.assets.precompile << Proc.new do |path|
    #   if path =~ /\.(css|js)\z/
    #     full_path = Rails.application.assets.resolve(path).to_path
    #     app_assets_path = Rails.root.join('app', 'assets').to_path
    #     if full_path.starts_with? app_assets_path
    #       puts "including asset: " + full_path
    #       true
    #     else
    #       puts "excluding asset: " + full_path
    #       false
    #     end
    #   else
    #     false
    #   end
    # end
  end
end
