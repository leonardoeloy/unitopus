# encoding: utf-8

def require_files(path)
  Dir.glob("#{File.dirname(__FILE__)}/#{path}/**/*.rb").each do |file|
    require file
  end
end

require 'rubygems'
require 'redcarpet'
require 'unitopus/generator'
require 'unitopus/plugin'
require 'unitopus/regex_plugin'
require_files 'unitopus/plugins'

module Unitopus
	VERSION = '0.0.1'
end