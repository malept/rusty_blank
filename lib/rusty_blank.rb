require 'thermite/fiddle'

toplevel_dir = File.dirname(File.dirname(__FILE__))
Thermite::Fiddle.load_module('init_rusty_blank',
                             cargo_project_path: toplevel_dir,
                             ruby_project_path: toplevel_dir)
