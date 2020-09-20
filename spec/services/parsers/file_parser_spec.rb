# frozen_string_literal: true

require 'rspec'
require_relative '../../../app/services/parsers/file_parser'
require_relative '../../../app/services/parsers/line_parser'
require_relative '../../../app/repositories/access_repository'
require_relative '../../../app/models/access'

describe Services::Parsers::FileParser do
  subject(:parser) { described_class.new(filename, repository, line_parser) }

  let(:filename)    { "#{Dir.pwd}/spec/data/single_line.log" }
  let(:line)        { '/home 184.123.665.067' }
  let(:access)      { Models::Access.new('/home', '184.123.665.067') }
  let(:repository)  { instance_double(Repositories::AccessRepository, register: access, accesses: nil) }
  let(:line_parser) { instance_double(Services::Parsers::LineParser, parse: line) }

  describe '#parse' do
    it 'registers the access' do
      allow(line_parser).to receive(:parse).and_return(access)
      parser.parse
      expect(repository).to have_received(:register).with(access)
    end
  end
end
