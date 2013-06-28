# encoding: utf-8

module Unitopus

  # Acts as an abstraction for plugins which will only perform regex operations
  class RegexPlugin < Unitopus::Plugin
    attr_reader :regex
    attr_reader :parameter

    # Receives the line to be processed and matches the regex against it.
    # It processes the MatchData to extract the value from the returning array if
    # only one value is present. Otherwise, an array is still returned.
    #
    # line: from markdown file
    #
    # Returns nil if no match found or { @parameter => result }
    def handle(line)
      raise "#{self.class}: No regex defined" if @regex.nil?

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
      Unitopus.logger.debug "#{self.class}: Applying regex [#{@regex}] to [#{line}], got [#{value}]"

      return nil if value.nil?

      to_return = { @parameter => value }
      Unitopus.logger.debug "#{self.class}: Will return [#{to_return}]"

      to_return
    end
  end
end