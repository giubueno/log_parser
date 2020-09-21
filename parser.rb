#!/usr/bin/env ruby
# frozen_string_literal: true

# it is necessary to run the program in the bundler context.
require 'bundler'
Bundler.require

require_relative './app/bootstrap'

if ARGV.empty?
  puts 'No argument found. Usage: ./parse.rb <log file path>'
else
  Boostrap.new(ARGV[0]).start
end
