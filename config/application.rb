# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Autonoma
  class Application < Rails::Application # rubocop:todo Style/Documentation
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      if File.exist?(env_file)
        YAML.safe_load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value.to_s
        end
      end
    end

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # config.time_zone = 'Bogota'
    # config.active_record.default_timezone = :local
    # config.active_record.time_zone_aware_attributes = false

    config.i18n.default_locale = :"es-CO"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    config.assets.precompile += ['appviews.css', 'cssanimations.css', 'dashboards.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css', 'commerce.css']
    config.assets.precompile += ['appviews.js', 'cssanimations.js', 'dashboards.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'commerce.js', 'metrics.js', 'landing.js']
    # -- all .rb files in that directory are automatically loaded.
    config.to_prepare do
      Devise::SessionsController.layout 'session'
      Devise::PasswordsController.layout 'session'
      Devise::PasswordsController.layout 'session'
      Devise::ConfirmationsController.layout 'session'
      # rubocop:todo Lint/AmbiguousBlockAssociation
      Devise::RegistrationsController.layout proc { |_controller| user_signed_in? ? 'application' : 'session' }
      # rubocop:enable Lint/AmbiguousBlockAssociation
      # Or to configure mailer layout
      # Devise::Mailer.layout "email" # email.haml or email.erb
    end
  end
end
