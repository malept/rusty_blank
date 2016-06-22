require 'fiddle'
require 'rbconfig'
require 'thermite/config'

libdir = File.dirname(__FILE__)
library_name = Thermite::Config.new(cargo_project_path: File.dirname(libdir)).shared_library
library = Fiddle.dlopen(File.join(libdir, library_name))
func = Fiddle::Function.new(library['init_rusty_blank'],
                            [], Fiddle::TYPE_VOIDP)
func.call
