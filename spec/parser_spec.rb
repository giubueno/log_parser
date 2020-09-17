require 'rspec'
require_relative '../parser'

describe Parser do
  describe '::parse_line' do
    let(:line) { '/about 722.247.931.582' }

    subject { Parser::parse_line(line) }

    it 'returns an open struct with the accessed path' do
      expect(subject.path).to eq('/about')
    end

    it 'returns an open struct with the ip' do
      expect(subject.ip).to eq('722.247.931.582')
    end

    context 'when the line is blank' do
      let(:line) { '' }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'when the line has only spaces' do
      let(:line) { '' }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end
  end

  describe '::Counter' do
    # TODO describe the class Counter
  end
end