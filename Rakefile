require 'bundler/gem_tasks'
require 'thermite/tasks'

thermite = Thermite::Tasks.new

task default: %w(thermite:build)

desc 'Run testsuite'
task test: %w(thermite:build thermite:test) do
  test_file = File.join(File.dirname(__FILE__), 'test', 'test_rusty_blank.rb')
  ruby "#{test_file} #{thermite.config.ruby_extension_path}"
  ruby test_file
end
