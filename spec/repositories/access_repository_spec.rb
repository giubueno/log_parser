# frozen_string_literal: true

describe Repositories::AccessRepository do
  let(:repository) { described_class.new }

  describe '.register' do
    subject(:result) { repository.register(access) }

    let(:access) { Models::Access.new('/home', '127.0.0.1') }

    context 'when register the a single access' do
      it 'count unique once' do
        expect(result.unique).to eq(1)
      end

      it 'count total once' do
        expect(result.total).to eq(1)
      end
    end

    context 'when register the same access twice' do
      subject(:result) do
        repository.register(access)
        repository.register(access)
      end

      it 'count unique only once' do
        expect(result.unique).to eq(1)
      end

      it 'count total twice' do
        expect(result.total).to eq(2)
      end
    end

    context 'when register more than a few registries' do
      let(:access2) { Models::Access.new('/home', '127.0.0.2') }

      subject(:result) do
        repository.register(access)
        repository.register(access2)
        repository.register(access2)
      end
      it 'calculate the average' do
        expect(result.average).to eq(1.5)
      end
    end
  end
end
