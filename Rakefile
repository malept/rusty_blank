require 'mkmf'
require 'rbconfig'

task default: %w(rust_shared_library)

desc 'Build or download the rust shared library'
task :rust_shared_library do
  # if cargo found, build. Otherwise, grab binary.
  if (cargo = find_executable(ENV.fetch('CARGO', 'cargo')))
    sh "#{cargo} build --release"
    sh "cp target/release/librusty_blank.#{RbConfig::CONFIG['DLEXT']} lib/"
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
task :test do
  ruby 'test.rb target/release/librusty_blank.so'
end
