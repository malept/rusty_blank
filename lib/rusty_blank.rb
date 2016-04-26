require 'fiddle'
require 'rbconfig'

library = Fiddle.dlopen("librusty_blank.#{RbConfig::CONFIG['DLEXT']}")
func = Fiddle::Function.new(library['init_rusty_blank'],
                            [], Fiddle::TYPE_VOIDP)
func.call
