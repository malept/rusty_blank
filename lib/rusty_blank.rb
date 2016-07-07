require 'fiddle'
require 'thermite/config'

toplevel_dir = File.dirname(File.dirname(__FILE__))
config = Thermite::Config.new(cargo_project_path: toplevel_dir, ruby_project_path: toplevel_dir)
library = Fiddle.dlopen(config.ruby_extension_path)
func = Fiddle::Function.new(library['init_rusty_blank'],
                            [], Fiddle::TYPE_VOIDP)
func.call
