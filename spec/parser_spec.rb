require 'rspec'
require_relative '../parser'

describe Parser do
  describe '::parse_line' do
    it 'returns the accessed path' do
      expect(Parser::parse_line('/about 722.247.931.582')).to eq('/about')
    end
  end
end