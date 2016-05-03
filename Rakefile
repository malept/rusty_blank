require 'mkmf'
require 'net/http'
require 'rbconfig'
require 'rexml/document'
require 'rubygems/package'
require 'tomlrb'
require 'uri'
require 'zlib'

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
    installed_binary = false
    name = 'rusty_blank'
    os = RbConfig::CONFIG['target_os']
    arch = RbConfig::CONFIG['target_cpu']
    releases_uri = URI("https://github.com/malept/#{name}/releases.atom")
    feed = REXML::Document.new(Net::HTTP.get(releases_uri))
    REXML::XPath.each(feed, '//entry/title[contains(.,"-rust")]/text()') do |tag|
      version = tag.to_s.slice(1..-6)
      download_uri = URI("https://github.com/malept/#{name}/releases/download/#{tag}/#{name}-#{version}-#{os}-#{arch}.tar.gz")
      case (response = Net::HTTP.get_response(download_uri))
      when Net::HTTPClientError
        next
      when Net::HTTPServerError
        raise response
      else
        puts "Downloading latest compiled version (#{version}) from GitHub"
        tgz = StringIO.new(Net::HTTP.get(URI(response['location'])))
        gz = Zlib::GzipReader.new(tgz)
        tar = Gem::Package::TarReader.new(gz)
        tar.each do |entry|
          next if entry.header.name.end_with?('/')
          File.open(entry.header.name, 'wb') do |f|
            f.write(entry.read)
          end
        end
        installed_binary = true
        break
      end
    end
    unless installed_binary
      fail <<EOM
****
Rust's Cargo is required to build this extension. Please install Rust and put
it in the PATH, or set the CARGO environment variable appropriately.
****
EOM
    end
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

desc 'Package rust library in a tarball'
task package_tarball: [:rust_shared_library] do
  toml = Tomlrb.load_file(File.join(File.dirname(__FILE__), 'Cargo.toml'), symbolize_keys: true)
  name = toml[:package][:name]
  version = toml[:package][:version]
  os = RbConfig::CONFIG['target_os']
  arch = RbConfig::CONFIG['target_cpu']
  sh "fpm -s dir -t tar --name '#{name}' --package '#{name}-#{version}-#{os}-#{arch}.tar.gz' lib/librusty_blank.#{RUSTY_BLANK_EXT}"
end
