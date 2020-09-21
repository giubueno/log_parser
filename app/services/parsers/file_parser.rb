# frozen_string_literal: true

require_relative '../../exceptions/parser_exception'

module Services
  module Parsers
    # Log file parser.
    class FileParser
      def initialize(filepath, repository, line_parser)
        @filepath = filepath
        @repository = repository
        @line_parser = line_parser
      end

      def parse
        raise Parser::ParserException, "#{filepath} does not exist." unless File.exist?(filepath)
        raise Parser::ParserException, "#{filepath} is not a file." unless File.file?(filepath)

        File.foreach(filepath) do |line|
          access = line_parser.parse(line)
          repository.register(access)
        end

        repository.accesses
      end

      private

      attr_accessor :filepath, :repository, :line_parser
    end
  end
end
