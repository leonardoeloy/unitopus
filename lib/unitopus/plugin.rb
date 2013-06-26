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
      
      #Unitopus.logger.info "Registering plugin #{base}..."
      @@plugins << base
    end

    def self.plugins
      @@plugins
    end    

    def self.handle(line)
      parameters = {}

      @@plugins.each do |plugin|
        klass = plugin.new
        Unitopus.logger.info "#{plugin}: #{klass.name} - Parameters: #{parameters}"
        value = klass.handle(line)
        parameters.merge klass.handle(line) unless value.nil?
      end

      parameters
    end
  end
end