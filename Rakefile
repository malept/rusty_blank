require 'thermite/tasks'

thermite = Thermite::Tasks.new(github_releases: true)

task default: %w(thermite:build)

desc 'Run testsuite'
task test: %w(thermite:build thermite:test) do
  ruby "test.rb lib/#{thermite.config.shared_library}"
end
