require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Milyst
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.action_mailer.smtp_settings = {
      address: 'smtp.postmarkapp.com',
      port: 587,
      domain: 'milyst.xyz',
      user_name: ENV['POSTMARK_API_TOKEN'],
      password: ENV['POSTMARK_API_TOKEN'],
      authentication:       :plain,
      enable_starttls_auto: true
    }



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
