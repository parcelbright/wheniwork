require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc "Run a console with wheniwork lib loaded"
task :console do
  sh "irb -rubygems -I lib -r wheniwork.rb"
end

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec]
