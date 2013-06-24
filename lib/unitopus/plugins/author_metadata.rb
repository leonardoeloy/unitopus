# encoding: utf-8

module Unitopus
  class AuthorMetadata < Unitopus::RegexPlugin
    def initialize
      @@author = "Leonardo Eloy <leonardo.eloy@gmail.com>"
      @@name = "Author Metadata"
      @@description = "Adds a 'published by' in a blog post"
      @@regex = /^Author:\ (.*)$/
      @@parameter = "author"
    end
  end
end  

