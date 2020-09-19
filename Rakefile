require 'rake'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
  
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format documentation']
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

task :default => :spec
task :spec => [:rubocop]