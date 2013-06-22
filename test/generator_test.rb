# encoding: utf-8

require 'test_helper'
require 'fileutils'

class GeneratorTest < Test::Unit::TestCase
  stage = "test/stage"

	context "generator" do 
    context "initialize" do
  		should "point to a base directory" do
  			assert_equal Dir.pwd, Unitopus::Generator.new(Dir.pwd).basedir	
  		end
    end

    should "list markdown files" do
      generator = Unitopus::Generator.new(stage)
      assert_equal ["#{stage}/test.md"], generator.files
    end

    context "site directory" do
      setup do
        @generator = Unitopus::Generator.new(stage)
        @site = "site"
        @site_path = "#{stage}/#{@site}"
      end

      should "be created" do
        FileUtils.rm_r(@site_path) if Dir.exist?(@site_path)

        assert @site_path, @generator.create_site(@site)
        assert Dir.exist?(@site_path), "directory #{@site_path} doesn't exists"
      end

      should "not raise error if it already exists" do
        Dir.mkdir(@site_path)
        assert @site_path, @generator.create_site(@site)
      end

      teardown do
        FileUtils.rm_r(@site_path) if Dir.exist?(@site_path)
      end
    end
	end
end