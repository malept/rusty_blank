require 'mkmf'
require 'rbconfig'

RUSTY_BLANK_EXT = (RbConfig::CONFIG['DLEXT'] == 'bundle' ? 'dylib' : RbConfig::CONFIG['DLEXT']).freeze

task default: %w(rust_shared_library)

desc 'Build or download the rust shared library'
task :rust_shared_library do
  # if cargo found, build. Otherwise, grab binary.
  if (cargo = find_executable(ENV.fetch('CARGO', 'cargo')))
    target = ENV.fetch('TARGET', 'release')
    sh "#{cargo} build#{' --release' if target == 'release'}"
    sh "cp target/#{target}/librusty_blank.#{RUSTY_BLANK_EXT} lib/"
  else
    # TODO: Download binary from GitHub
    fail <<EOM
****
Rust's Cargo is required to build this extension. Please install Rust and put
it in the PATH, or set the CARGO environment variable appropriately.
****
EOM
  end
end

desc 'Run testsuite'
task test: [:rust_shared_library] do
  ruby "test.rb lib/librusty_blank.#{RUSTY_BLANK_EXT}"
end

desc 'Clean up after build process'
task :clean do
  sh "rm -f lib/librusty_blank.#{RUSTY_BLANK_EXT}"
  if (cargo = find_executable(ENV.fetch('CARGO', 'cargo')))
    sh "#{cargo} clean"
  end
end
