require 'fiddle'
require 'rbconfig'

ext = RbConfig::CONFIG['DLEXT'] == 'bundle' ? 'dylib' : RbConfig::CONFIG['DLEXT']
basename = "librusty_blank.#{ext}"
library = Fiddle.dlopen(File.join(File.dirname(__FILE__), basename))
func = Fiddle::Function.new(library['init_rusty_blank'],
                            [], Fiddle::TYPE_VOIDP)
func.call
