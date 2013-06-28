# encoding: utf-8

require File.join(File.dirname(__FILE__), 'test_helper')

class RegexPluginTest < Test::Unit::TestCase
  context "regex plugin" do
    setup do
      class DumbPlugin < Unitopus::RegexPlugin 
        def initialize
          @regex = /^Example: (.*)$/
          @parameter = :example
        end
      end

      @plugin = DumbPlugin.new
    end

    should "raise exception if regex not specified" do
      class WrongDumbPlugin < Unitopus::RegexPlugin 
        def initialize
        end
      end

      @plugin = WrongDumbPlugin.new
      assert_raise RuntimeError do
        @plugin.handle "test"
      end
    end

    should "match one group" do
      actual = @plugin.handle("Example: value")
      expected = { :example => "value"}

      assert_equal expected, actual
    end

    should "match more than one group" do
      class DumbPlugin < Unitopus::RegexPlugin 
        def initialize
          @regex = /^Example: (.*) - (.*)$/
          @parameter = :example
        end
      end

      @plugin = DumbPlugin.new
      actual = @plugin.handle("Example: first - second")
      expected = { :example => ["first", "second"] }

      assert_equal expected, actual
    end

    should "return nil when no matches happen" do
      assert_nil @plugin.handle("any string")
    end
  end
end