require 'fiddle'
require 'rbconfig'

basename = "librusty_blank.#{RbConfig::CONFIG['DLEXT']}"
library = Fiddle.dlopen(File.join(File.dirname(__FILE__), basename))
func = Fiddle::Function.new(library['init_rusty_blank'],
                            [], Fiddle::TYPE_VOIDP)
func.call
