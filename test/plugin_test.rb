# encoding: utf-8

require 'test_helper'

class PluginTest < Test::Unit::TestCase

  context "plugin" do 
    should "have an author" do
      plugin = Unitopus::Plugin.new

      assert_respond_to plugin, :author
    end

  end
end
