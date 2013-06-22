# enconding: utf-8
module Unitopus
	class Generator
		attr_reader :basedir
		attr_reader :site

		# Initializes a generator
		#
		# basedir: Directory where .md files are located
		#
		# Returns a new instance
		def initialize(basedir)
			@basedir = basedir

			@site = "site"
			sitepath = "#{@basedir}/#{@site}"
			Dir.mkdir(sitepath) unless Dir.exist?(sitepath)

			@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
		end

		# Lists available markdown files to be processed
		#
		# Returns a list of string with available markdown files
		def files
			Dir.glob("#{@basedir}/**/*.md")
		end

		# Renders a file using Markdown
		#
		# file: file path to be read and rendered
		#
		# Return process HTML string
		def markdown(file)
			content = File.readlines(file).join(" ")

			@markdown.render content
		end

		# Creates the rendered markdown file
		#
		# file: absolute Markdown file path
		#
		# Returns the created absolute file path
		def create_markdown(file)
			filename = file.split("/").last.gsub(".md", ".html")
			filepath = "#{basedir}/#{site}/#{filename}"

			f = File.open(filepath, "w") 
			f << markdown(file)
			f.close

			filepath
		end

		# Generates a static site
		#
		# basedir: base directory where markdown files will be read
		def self.from(basedir)
			generator = Unitopus::Generator.new(basedir)

			generator.files.each do |file|
				generator.create_markdown(file)
			end
		end
	end
end