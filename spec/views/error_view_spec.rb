# frozen_string_literal: true

describe Views::ErrorView do
  describe '.render' do
    let(:canvas) { instance_double(Utils::Canvas.name, print_line: 'The following error has occurred.') }
    let(:exception) { Parser::ParserException.new('Something happened') }

    it 'renders the exception' do
      described_class.new(canvas).render(exception)
      expect(canvas).to have_received(:print_line).with('The following error has occurred.')
    end
  end
end
