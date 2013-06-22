# encoding: utf-8

require 'test_helper'

class GeneratorTest < Test::Unit::TestCase
	context "generator" do 
    context "initialize" do
  		should "point to current directory" do
  			assert_equal Dir.pwd, Unitopus::Generator.new(Dir.pwd).basedir	
  		end
    end

    should "list markdown files" do
      basedir = "test/markdown_files"
      generator = Unitopus::Generator.new(basedir)
      assert_equal ["#{basedir}/test.md"], generator.files
    end
	end
end