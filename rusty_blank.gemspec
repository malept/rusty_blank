# -*- coding: utf-8 -*-
require 'English'

Gem::Specification.new do |s|
  s.name        = 'rusty_blank'
  s.version     = '0.0.1'
  s.summary     = 'Rust String.blank?'
  s.description = 'String.blank? from ActiveSupport, written in Rust'

  s.authors     = ['Mark Lee']
  s.email       = 'malept@users.noreply.github.com'
  s.homepage    = 'https://github.com/malept/rusty_blank'
  s.license     = 'MIT'

  s.extensions    = %w(Rakefile)
  s.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  s.require_paths = %w(lib)
  s.test_files    = %w(test.rb)

  s.add_runtime_dependency 'rake', '~> 11'
  s.add_development_dependency 'fpm', '~> 1.5.0'
  s.add_development_dependency 'tomlrb', '~> 1.2.1'
end
