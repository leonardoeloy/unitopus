# encoding: utf-8

require 'test_helper'

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
  end
end
