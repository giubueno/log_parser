# frozen_string_literal: true

describe Services::Parsers::LineParser do
  subject(:parser) { described_class.new }

  describe '#parse' do
    let(:access) { parser.parse('/about 722.247.931.582') }

    it { expect(access.path).to eq('/about') }
    it { expect(access.ip).to eq('722.247.931.582') }
  end
end
