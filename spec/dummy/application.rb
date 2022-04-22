# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __dir__)

require "bundler/setup" if File.exist?(ENV["BUNDLE_GEMFILE"])
$LOAD_PATH.unshift File.expand_path("../../lib", __dir__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

# require "action_mailer/railtie"
# require "active_job/railtie"
# require "active_storage/engine"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require "backend"

Dir[Backend::Engine.root.join("spec/support/backends/*.rb")].sort.each { |f| require f }

module Dummy
  APP_ROOT = File.expand_path(".", __dir__)

  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    # config.action_mailer.default_url_options = { host: "dummy.example.com" }
    # config.action_mailer.delivery_method = :test

    config.action_controller.allow_forgery_protection = false
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.active_support.deprecation = :stderr
    config.active_support.test_order = :random
    config.cache_classes = true
    config.consider_all_requests_local = true
    config.eager_load = false
    config.encoding = "utf-8"
    config.secret_key_base = "SECRET_KEY_BASE"

    config.paths["app/controllers"] << "#{APP_ROOT}/app/controllers"
    config.paths["app/models"] << "#{APP_ROOT}/app/models"
    # config.paths["app/mailers"] << "#{APP_ROOT}/app/mailers"
    # config.paths["app/views"] << "#{APP_ROOT}/app/views"
    config.paths["config/database"] = "#{APP_ROOT}/config/database.yml"
    config.paths.add "config/routes.rb", with: "#{APP_ROOT}/config/routes.rb"

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
