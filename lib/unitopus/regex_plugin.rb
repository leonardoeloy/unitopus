# encoding: utf-8

module Unitopus
  class RegexPlugin < Plugin
    attr_reader :regex
    attr_reader :parameter

    def handle(line)
      # Matches the current line against the specified regex
      # and skips the first element of the array, which is always the
      # matched string.
      # e.g:
      # /^Author: (.*)$/.match("Author: Leonardo Eloy").to_a
      # => ["Author: Leonardo Eloy", "Leonardo Eloy"]
      # (...).to_a.[1..-1]
      # => ["Leonardo Eloy"]
      
      value = @regex.match(line).to_a[1..-1]
      value = value[0] if value != nil and value.kind_of?(Array) and value.length == 1

      return nil unless value != nil

      { @parameter => value }
    end
  end
end