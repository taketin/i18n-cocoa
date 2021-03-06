module I18n
  module Cocoa

    class Issue
      # @return [string]    set information
      attr_reader :description

      # @return [array]     set problem's data
      attr_reader :values

      def initialize description, values
        @description = description
        @values = values
      end
    end

    module Utils

      def self.encode string
        # invalid byte sequence in US-ASCII (ArgumentError)
        replace_invalid_byte string
      end

      def self.replace_invalid_byte string
        replace_options = { invalid: :replace, undef: :replace, replace: '?' }
        temporal_encoding = (string.encoding == Encoding::UTF_8 ? Encoding::UTF_16BE : Encoding::UTF_8)
        string.encode(temporal_encoding, string.encoding, replace_options).encode(string.encoding)
      end

      def self.create_issue description, values
        Issue.new description, values
      end
    end
  end
end
