# encoding: utf-8

require File.join(File.dirname(__FILE__), '..', 'test_helper')

class AuthorMetadataTest < Test::Unit::TestCase
  context "author metadata plugin" do
    setup do
      @plugin = Unitopus::Plugins::AuthorMetadata.new
    end

    should "have a regex" do
      assert_equal /^Author:\ (.*)$/, @plugin.regex
    end

    should "have a parameter" do
      assert_equal :author, @plugin.parameter
    end

    should "work!" do
      actual = @plugin.handle("Author: Someone Huge")
      expected = { :author => "Someone Huge" }
      assert_equal expected, actual
    end
  end
end