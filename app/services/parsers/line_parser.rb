# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object/blank'
require_relative '../../models/access'

module Services
  module Parsers
    # Parser for a single line.
    class LineParser
      def parse(line)
        return nil if line.blank?

        tokens = line.split(' ')
        Models::Access.new(tokens[0], tokens[1])
      end
    end
  end
end
