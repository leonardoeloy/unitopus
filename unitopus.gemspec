## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'unitopus'
  s.version           = '0.0.1'
  s.date              = '2013-06-21'
  s.rubyforge_project = 'unitopus'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "Static blog generator that doesn't sucks"
  s.description = "Unitopus brings the simplicity that no bi-polar man or any eight legged sea creature would!"

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["Leonardo Eloy"]
  s.email    = 'leo@leonardoeloy.com'
  s.homepage = 'https://github.com/leonardoeloy/unitopus'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## If your gem includes any executables, list them here.
  s.executables = ["unitopus"]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE.md]

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }

  s.add_runtime_dependency('commander', '~> 4.1.3')
  s.add_runtime_dependency('redcarpet', '~> 2.3.0')
  s.add_runtime_dependency('mustache', '~> 0.99.4')
  s.add_development_dependency('rake', "~> 10.0.3")
  s.add_development_dependency("test-unit", "~> 2.5.4")
  s.add_development_dependency('shoulda', "~> 3.3.2")
  s.add_development_dependency('rdoc', "~> 3.11")
  s.add_development_dependency('redcarpet', '~> 2.3.0')
  s.add_development_dependency('mustache', '~> 0.99.4')  
end