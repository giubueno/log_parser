# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format documentation']
end

RuboCop::RakeTask.new(:rubocop)

task default: :spec
task spec: [:rubocop]
