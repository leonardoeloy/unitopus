# enconding: utf-8

module Unitopus
  class Plugin
    VERSION = 1.0
    attr_reader :name, :description, :author

    def initialize
      # Placeholder
    end

    def handle(line)
      # Placeholder
    end

    @@plugins = []

    def self.inherited(base)
      @@plugins << base.name
    end

    def self.plugins
      @@plugins
    end    

    def self.handle(line)
      plugins.each do |plugin|
        klass = Object.const_get(plugin)
        
      end
    end
  end
end