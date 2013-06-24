# encoding: utf-8

def require_files(path)
  Dir.glob("#{File.dirname(__FILE__)}/#{path}/**/*.rb").each do |file|
    require file
  end
end

require 'rubygems'
require 'logger'
require 'redcarpet'
require 'mustache'
require 'unitopus/generator'
require 'unitopus/plugin'
require 'unitopus/regex_plugin'

require_files 'unitopus/plugins'

module Unitopus
	VERSION = '0.0.1'

  def self.logger
    @@logger ||= Logger.new "unitopus.log"
  end
end