# enconding: utf-8
module Unitopus
	class Generator
		attr_reader :basedir

		# Initializes a generator
		#
		# basedir: Directory where .md files are located
		#
		# Returns a new instance
		def initialize(basedir)
			@basedir = basedir
		end

		# Lists available markdown files to be processed
		#
		# Returns a list of string with available markdown files
		def files
			Dir.glob("#{@basedir}/**/*.md")
		end

		# Creates a site directory
		#
		# site: name of the directory, defaults to "site"
		#
		# Returns the full path: basedir + site
		def create_site(site = "site")
			path = "#{basedir}/#{site}"

			Dir.mkdir(path) unless Dir.exist?(path)

			path	
		end
	end
end