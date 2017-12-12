#!/usr/bin/env ruby

require 'minitest/autorun'

#
# Extremely basic unit test for rusty_blank
#
class TestRustyBlank < MiniTest::Test
  def test_blank?
    str = ''
    refute str.respond_to?(:blank?), 'String should not have blank?'

    load_library

    assert str.respond_to?(:blank?), 'String should have blank?'
    assert str.blank?, 'Empty string should be blank'
    assert '  '.blank?, 'Spaces should be blank'
  end

  def load_library
    if ARGV[0]
      require 'fiddle'
      library = Fiddle.dlopen(ARGV[0])
      func = Fiddle::Function.new(library['init_rusty_blank'],
                                  [], Fiddle::TYPE_VOIDP)
      func.call
    else
      puts "Requiring rusty_blank on Ruby #{RbConfig::CONFIG['ruby_version']}"
      require 'rusty_blank'
    end
  end
end
