# frozen_string_literal: true

require 'rspec'
require_relative '../../app/views/error_view'
require_relative '../../app/exceptions/parser_exception'
require_relative '../../app/utils/canvas'

describe Views::ErrorView do
  describe '.render' do
    let(:canvas) { instance_double(Utils::Canvas.name, puts: 'The following error has occurred.') }
    let(:exception) { Parser::ParserException.new('Something happened') }

    it 'renders the exception' do
      described_class.new(canvas).render(exception)
      expect(canvas).to have_received(:puts).with('The following error has occurred.')
    end
  end
end
