require 'bundler/gem_tasks'
require 'thermite/tasks'

thermite = Thermite::Tasks.new

task default: %w(thermite:build)

desc 'Run testsuite'
task test: %w(thermite:build thermite:test) do
  ruby "test/test_rusty_blank.rb #{thermite.config.ruby_extension_path}"
  ruby 'test/test_rusty_blank.rb'
end
