#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/exc_exp'
  t.test_files = FileList['test/lib/exc_exp/*_test.rb']
  t.verbose = true
end
 
task :default => :test