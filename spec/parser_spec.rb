require 'rspec'
require_relative '../parser'

describe Parser do
  describe '::parse_line' do
    it 'returns the accessed path' do
      expect(Parser::parse_line('/about 722.247.931.582')).to eq('/about')
    end

    context 'when the line is blank' do
      it 'returns nil' do
        expect(Parser::parse_line('')).to be_nil
      end
    end

    context 'when the line has only spaces' do
      it 'returns nil' do
        expect(Parser::parse_line('   ')).to be_nil
      end
    end
  end
end