# encoding: utf-8

require 'test/unit'
require 'shoulda'
require 'unitopus'
require 'tmpdir'

def setup_stage
  stage_fixture = File.join(File.dirname(__FILE__), "stage")
  stage = File.join(Dir.tmpdir, "unitopus-test-stage#{rand(10000000000)}")

  FileUtils.cp_r(stage_fixture, stage)

  stage
end

def teardown_stage(stage)
  FileUtils.rm_r(stage) unless Dir.exist?(stage)
end