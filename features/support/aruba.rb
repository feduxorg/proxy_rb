# frozen_string_literal: true
require 'aruba/cucumber'

Aruba.configure do |config|
  config.exit_timeout                          = 10
  config.io_wait_timeout                       = 2
  config.activate_announcer_on_command_failure = [:stderr, :stdout, :command]
end