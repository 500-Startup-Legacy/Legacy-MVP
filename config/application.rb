require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Legacy
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    # config.twilio_numbers = ['2023910271', '7033497371','3472153240']
    config.twilio_numbers = ['9173823711', '9173828318', '9173821836', '9173821928', '9173823479']
  end
end



