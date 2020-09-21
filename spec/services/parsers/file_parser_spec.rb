# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
describe Services::Parsers::FileParser do
  subject(:parser) { described_class.new(filename, repository, line_parser) }

  let(:filename)    { "#{Dir.pwd}/spec/data/single_line.log" }
  let(:access)      { Models::Access.new('/home', '184.123.665.067') }
  let(:repository)  { instance_double(Repositories::AccessRepository, register: access, accesses: nil) }
  let(:line_parser) { instance_double(Services::Parsers::LineParser, parse: '/home 184.123.665.067') }

  describe '#parse' do
    before { allow(line_parser).to receive(:parse).and_return(access) }

    context 'when the log does not exist' do
      let(:filename) { "#{Dir.pwd}/spec/data/does-not-exist.log" }

      it 'raises an exception' do
        expect { parser.parse }.to raise_error(Parser::ParserException)
      end
    end

    context 'when the log has a single line' do
      it 'registers the access' do
        parser.parse
        expect(repository).to have_received(:register).with(access)
      end
    end

    context 'when the log is empty' do
      let(:filename) { "#{Dir.pwd}/spec/data/empty.log" }

      it 'does not fail' do
        expect(repository).not_to have_received(:register)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
