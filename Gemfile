# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

RAILS_VERSION = ENV.fetch("RAILS_VERSION", "~> 7.0.0")

if RAILS_VERSION == "master"
  gem "rails", github: "rails/rails", require: false
else
  gem "rails", RAILS_VERSION, require: false
end

gem "capybara"
gem "codecov", require: false
# gem "factory_bot_rails", "~> 6.0"
# gem "faker", "~> 2.19"
# gem "generator_spec"
# gem "rails-controller-testing"
gem "rspec"
gem "rspec-rails"
gem "rubocop", require: false
gem "rubocop-rails", require: false
gem "rubocop-rspec", require: false
gem "simplecov", require: false
gem "sqlite3"
# gem "timecop"
