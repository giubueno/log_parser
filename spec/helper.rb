# frozen_string_literal: true

require 'simplecov'

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

SimpleCov.start do
  add_filter '/spec/'
end
