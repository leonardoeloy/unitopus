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
      # Just register plugins from the Unitopus::Plugins module
      return unless base.name =~ /^Unitopus::Plugins::.*$/
      @@plugins << base.name
    end

    def self.plugins
      @@plugins
    end    

    def self.handle(line)
      parameters = {}

      plugins.each do |plugin|
        Unitopus.logger.info "Plugin: #{plugin} - Parameters: #{parameters}"
        klass = Object.const_get(plugin)

        parameters << klass.handle(line)
      end
    end
  end
end