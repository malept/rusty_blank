#!/usr/bin/env ruby

require 'fiddle'
require 'minitest/autorun'

#
# Extremely basic unit test for rusty_blank
#
class TestRustyBlank < MiniTest::Test
  def test_blank?
    str = ''
    refute str.respond_to?(:blank?), 'String should not have blank?'

    library = Fiddle.dlopen(ARGV[0])
    func = Fiddle::Function.new(library['init_rusty_blank'],
                                [], Fiddle::TYPE_VOIDP)
    func.call

    assert str.respond_to?(:blank?), 'String should have blank?'
    assert str.blank?, 'Empty string should be blank'
    assert '  '.blank?, 'Spaces should be blank'
  end
end
