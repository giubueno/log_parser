# frozen_string_literal: true

require 'rspec'
require_relative '../../app/utils/canvas'
require_relative '../../app/views/result_view'
require_relative '../../app/models/path'

describe Views::ResultView do
  describe '.render' do
    let(:accesses) { [Models::Path.new('/home', 3, 1), Models::Path.new('/about', 2, 2)] }
    let(:about_message) { '/about 2 visits ' }
    let(:home_message) { '/home 1 visits ' }
    let(:canvas) { instance_double(Utils::Canvas.name, print_line: about_message) }

    # rubocop:disable RSpec/MultipleExpectations
    it 'renders right content' do
      described_class.new(canvas).render(accesses)
      expect(canvas).to have_received(:print_line).with('/home 3 visits')
      expect(canvas).to have_received(:print_line).with('/about 2 visits')
      expect(canvas).to have_received(:print_line).with('/about 2 unique views')
      expect(canvas).to have_received(:print_line).with('/home 1 unique views')
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
