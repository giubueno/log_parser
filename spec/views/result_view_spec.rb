# frozen_string_literal: true

require 'rspec'
require_relative '../../app/utils/canvas'
require_relative '../../app/views/result_view'
require_relative '../../app/models/path'

describe Views::ResultView do
  describe '.render' do
    let(:accesses) { [Models::Path.new('/home', 1, 1), Models::Path.new('/about', 2, 1)] }
    let(:header) { 'List of webpages with most page views ordered from most pages views to less page views:' }
    let(:about_message) { '/about 2 visits ' }
    let(:home_message) { '/home 1 visits ' }
    let(:canvas) { instance_double(Utils::Canvas.name, puts: header, print: about_message) }

    it 'renders the top message' do
      described_class.new(canvas).render(accesses)
      expect(canvas).to have_received(:puts).with(header)
    end

    it 'renders the /about total visits' do
      described_class.new(canvas).render(accesses)
      expect(canvas).to have_received(:print).with(about_message)
    end

    it 'renders the /home total visits' do
      described_class.new(canvas).render(accesses)
      expect(canvas).to have_received(:print).with(home_message)
    end
  end
end
