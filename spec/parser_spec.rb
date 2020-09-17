require 'rspec'
require_relative '../parser'

describe Parser do
  describe '::parse_line' do
    let(:line) { '/about 722.247.931.582' }

    subject { Parser::parse_line(line) }

    it 'returns a struct with the accessed path' do
      expect(subject.path).to eq('/about')
    end

    it 'returns a struct with the ip' do
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
    describe '.add' do
      let(:counter) { Parser::Counter.new }
      let(:line) { '/about 722.247.931.582' }

      subject { counter.add(line) }

      it 'returns an struct with the number of non-unique access' do
        expect(subject.non_unique).to eq(1)
      end

      it 'returns an struct with the number of unique accesses' do
        expect(subject.unique).to eq(1)
      end

      context 'when the same line is added' do
        subject do 
          counter.add(line)
          counter.add(line)
        end

        it 'returns only one unique access' do
          expect(subject.unique).to eq(1)
        end

        it 'returns two non-unique access' do
          expect(subject.non_unique).to eq(2)
        end
      end

      context 'when two different lines are added' do
        let(:other_line) { '/home 722.247.931.582' }

        subject do 
          counter.add(line)
          counter.add(other_line)
        end

        it 'returns only one unique access' do
          expect(subject.unique).to eq(1)
        end

        it 'returns only one non-unique access' do
          expect(subject.non_unique).to eq(1)
        end
      end
    end
  end
end