# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  track_files "/app/**/*.rb"
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
