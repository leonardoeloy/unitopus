# encoding: utf-8

require File.join(File.dirname(__FILE__), 'test_helper')

class PluginTest < Test::Unit::TestCase

  context "plugin" do
    setup do
      @plugin = Unitopus::Plugin.new
    end

    should "have an author" do
      assert_respond_to @plugin, :author
    end

    should "have a description" do
      assert_respond_to @plugin, :description
    end    

    should "have a name" do
      assert_respond_to @plugin, :name
    end    

    should "have a version" do
      assert_not_nil Unitopus::Plugin::VERSION
    end  

    should "handle processing" do
      assert_respond_to @plugin, :handle
    end

    context "registry" do
      should "have all plugins" do
        current_plugins = Unitopus::Plugin.plugins

        class DumbPlugin < Unitopus::Plugin
        end

        expected_plugins = current_plugins << "DumbPlugin"
        assert_equal expected_plugins, Unitopus::Plugin.plugins 
      end

      should "run all plugins" do
        # clear plugins, not cool though
        Unitopus::Plugin.plugins.clear
        
        class SuperDumbPlugin < Unitopus::RegexPlugin
          def initialize
            @author = "John Doe <john.doe@megacorp.net"
            @name = "Dumb Plugin"
            @description = "Used to verify if tests are running properly"
            @regex = /^test:\ (.*)$/
            @parameter = :test_value
          end
        end

        class AnotherPlugin < Unitopus::Plugin
          def initialize
            @author = "John Doe <john.doe@megacorp.net"
            @name = "Another Dumb Plugin"
            @description = "Used to verify if tests are running properly, again"
          end

          def handle(line)
            { :plugin_executed => true }
          end
        end

        Unitopus::Plugin.plugins << SuperDumbPlugin.new
        Unitopus::Plugin.plugins << AnotherPlugin.new

        parameters = Unitopus::Plugin.handle("test: value")
        assert_not_nil parameters
        assert_equal parameters[:test_value], "value"
        assert parameters[:plugin_executed]
      end
    end
  end
end
