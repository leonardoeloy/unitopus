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

    def self.inherited(base)
      # Just register plugins from the Unitopus::Plugins module
      return unless base.name =~ /^Unitopus::Plugins::.*$/

      # FIXME Somehow this raises an error. Are all the methods loaded into ObjectSpace while inherited is being called?
      # Unitopus.logger.info "Registering plugin #{base}..."
      plugins << base.new
    end

    def self.plugins
      @@plugins ||= []
    end    

    def self.handle(lines)
      parameters = {}
      lines = [lines] unless lines.kind_of?(Array)

      lines.each do |line|
        parameters.merge! handle_line(line)
      end

      parameters
    end

    private
    def self.handle_line(line)
      parameters = {}
      Unitopus.logger.debug "Plugin: Processing line #{line}"
      @@plugins.each do |plugin|
        Unitopus.logger.debug "Before calling #{plugin}: #{parameters}"

        value = plugin.handle(line)
        Unitopus.logger.debug "After calling #{plugin}: #{parameters}"
        
        parameters.merge!(value) unless value.nil?
      end
      
      parameters 
    end

  end
end