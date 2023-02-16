require 'rails_helper'
require 'capybara/rspec'

RSpec.configure do |config|
  # Include Warden, to enable access to faster sign in options for integration tests (#login_as)
  config.include Warden::Test::Helpers

  # Enabling headless will run feature specs in the background
  # Otherwise, feature specs will default to opening a window.
  headless_mode = ENV.fetch("HEADLESS", "false").downcase
  puts "HEADLESS MODE #{headless_mode}"

  case ENV.fetch("HEADLESS", "false").downcase
  when "true", "1"
    Capybara.default_driver = :selenium_chrome_headless
  else
    Capybara.default_driver = :selenium_chrome
  end
end
