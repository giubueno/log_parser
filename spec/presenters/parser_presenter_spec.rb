# frozen_string_literal: true

describe Presenters::ParserPresenter do
  describe '.start' do
    subject(:presenter) { described_class.new(service, error_view, result_view) }

    let(:service)     { instance_double(Services::Parsers::FileParser.name, parse: nil) }
    let(:result_view) { instance_double(Views::ResultView.name, render: nil) }
    let(:error_view)  { instance_double(Views::ErrorView.name, render: nil) }

    it 'invoke the parser' do
      presenter.start
      expect(service).to have_received(:parse)
    end

    it 'renders the result view' do
      presenter.start
      expect(result_view).to have_received(:render)
    end

    context 'when an exception is raised' do
      it 'renders the error view' do
        allow(service).to receive(:parse).and_raise(Parser::ParserException)
        presenter.start
        expect(error_view).to have_received(:render)
      end
    end
  end
end
