# encoding: utf-8

require 'test_helper'

class RegexPluginTest < Test::Unit::TestCase
  context "regex plugin" do
    setup do
      class DumbPlugin < Unitopus::RegexPlugin 
        def initialize
          @regex = /^Example: (.*)$/
          @parameter = :example
        end
      end
    end

    should "process the line and return a parameter" do
      dumb_plugin = DumbPlugin.new
      actual = dumb_plugin.handle("Example: value")
      expected = { :example => "value"}
      
      assert_equal expected, actual
    end
  end
end