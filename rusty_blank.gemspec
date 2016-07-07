# -*- coding: utf-8 -*-
require 'English'

Gem::Specification.new do |s|
  s.name        = 'rusty_blank'
  s.version     = '0.0.2'
  s.summary     = 'Rust String.blank?'
  s.description = 'String.blank? from ActiveSupport, written in Rust'

  s.authors     = ['Mark Lee']
  s.email       = 'malept@users.noreply.github.com'
  s.homepage    = 'https://github.com/malept/rusty_blank'
  s.license     = 'MIT'

  s.extensions    = %w(Rakefile)
  s.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  s.require_paths = %w(lib)
  s.test_files    = %w(test/test_rusty_blank.rb)

  s.add_runtime_dependency 'thermite', '~> 0'
  s.add_development_dependency 'minitest', '~> 5.8'
end
