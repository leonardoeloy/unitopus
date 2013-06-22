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
        assert Dir.exist?(@site_path), "directory #{@site_path} doesn't exists"
      end

      should "not raise error if it already exists" do
        FileUtils.rm_r(@site_path) if Dir.exist?(@site_path)
        Dir.mkdir(@site_path)
        assert Unitopus::Generator.new(stage)
      end

      teardown do
        FileUtils.rm_r(@site_path) if Dir.exist?(@site_path)
      end
    end

    context "markdown processor" do
      setup do
        FileUtils.rm_r("#{stage}/site") if Dir.exist?("#{stage}/site")
      end  
          
      should "render a file" do
        generator = Unitopus::Generator.new(stage)

        rendered = generator.markdown("#{stage}/test.md")

        assert "<h1>This is a test</h1>", rendered
      end

      should "create HTML file" do
        generator = Unitopus::Generator.new(stage)
        filepath = generator.create_markdown("#{stage}/test.md")

        assert File.exist?(filepath)
      end

      should "convert existing files" do
        Unitopus::Generator.from(stage)

        html_file = "#{stage}/site/test.html"
        assert File.exist?(html_file), "HTML file #{html_file} doesn't exists"
      end

    end
	end
end