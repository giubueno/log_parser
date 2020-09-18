# frozen_string_literal: true

require 'rspec'
require_relative '../parser'

describe Parser do
  describe '::parse_line' do
    subject { Parser::parse_line(line) }

    let(:line) { '/about 722.247.931.582' }

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
    let(:counter) { Parser::Counter.new }
    let(:line) { '/about 722.247.931.582' }

    describe '.add' do
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
        subject do
          counter.add(line)
          counter.add(other_line)
        end

        let(:other_line) { '/home 722.247.931.582' }

        it 'returns only one unique access' do
          expect(subject.unique).to eq(1)
        end

        it 'returns only one non-unique access' do
          expect(subject.non_unique).to eq(1)
        end
      end
    end

    describe '.totals' do
      subject { counter.totals.map(&:first) }
      
      let(:line1) { '/home 722.247.931.582' }
      let(:line2) { '/home/index 722.247.931.582' }
      let(:line3) { '/home/index 722.247.931.583' }

      before do
        counter.add(line1)
        counter.add(line2)
        counter.add(line3)
      end

      it 'returns a sorted hash (descending and ordered by unique accesses)' do
        expect(subject).to eq(['/home/index', '/home'])
      end

      context 'when sort is passed as asc' do
        subject { counter.totals(:unique, :asc).map(&:first) }

        it 'returns a sorted hash (ascending and ordered by unique accesses)' do
          expect(subject).to eq(["/home", "/home/index"])
        end
      end
    end
  end
end
