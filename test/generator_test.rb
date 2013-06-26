# encoding: utf-8

require 'test_helper'
require 'fileutils'

class GeneratorTest < Test::Unit::TestCase
	context "generator" do 
    setup do
      @stage = setup_stage
    end

    teardown do
      teardown_stage @stage
    end

    context "initialize" do
      should "point to a base directory" do
        assert_equal Dir.pwd, Unitopus::Generator.new(Dir.pwd).basedir  
      end
    end

    should "list markdown files" do
      generator = Unitopus::Generator.new(@stage)
      files = generator.files

      assert files.include?("#{@stage}/test-without-metadata.md")
      assert files.include?("#{@stage}/test.md")
    end

    context "site directory" do
      setup do
        @stage = setup_stage
        @generator = Unitopus::Generator.new(@stage)
        @site = "site"
        @site_path = File.join(@stage, @site)
      end

      teardown do
        teardown_stage @stage
      end      

      should "be created" do
        assert Dir.exist?(@site_path), "directory #{@site_path} doesn't exists"
      end

      should "not raise error if it already exists" do
        FileUtils.rm_r(@site_path) if Dir.exist?(@site_path)
        Dir.mkdir(@site_path)
        assert Unitopus::Generator.new(@stage)
      end
    end

    context "markdown processor" do
      setup do
        @stage = setup_stage
      end  

      should "render a file" do
        generator = Unitopus::Generator.new(@stage)

        rendered = generator.markdown("#{@stage}/test-without-metadata.md")

        assert "<h1>This is a test</h1>", rendered
      end

      should "create HTML file" do
        generator = Unitopus::Generator.new(@stage)
        filepath = generator.create_markdown("#{@stage}/test-without-metadata.md")

        assert File.exist?(filepath)
      end

      should "convert existing files" do
        Unitopus::Generator.from(@stage)

        html_file = "#{@stage}/site/test-without-metadata.html"
        assert File.exist?(html_file), "HTML file #{html_file} doesn't exists"
      end

      teardown do
        teardown_stage @stage
      end      
    end

    context "plugin integration" do
    end
	end
end