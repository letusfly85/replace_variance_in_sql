# encoding: utf-8

require 'rubygems'
require 'tempfile'
require 'inifile'

$ini = IniFile::load("app.properties")

def require_dir_ruby_files(dir)
    Dir::entries(dir).each do |ruby_file|
        next unless File::extname(ruby_file) == ('.rb')

        ruby_path = File::join(dir, ruby_file)
        require ruby_path
    end   
end

require_dir_ruby_files("src")
