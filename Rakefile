require 'thermite/tasks'

thermite = Thermite::Tasks.new(github_releases: true)

task default: %w(thermite:build)

desc 'Run testsuite'
task test: %w(thermite:build thermite:test) do
  ruby "test.rb #{thermite.config.ruby_extension_path}"
end
