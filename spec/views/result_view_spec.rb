# frozen_string_literal: true

describe Views::ResultView do
  describe '.render' do
    let(:accesses) { [Models::Path.new('/home', 3, 1), Models::Path.new('/about', 2, 2)] }
    let(:canvas) { instance_double(Utils::Canvas.name, print_same_line: nil, print_line: nil) }

    # rubocop: disable RSpec/MultipleExpectations
    # rubocop: disable RSpec/ExampleLength
    it 'renders the header' do
      described_class.new(canvas).render(accesses)
      expect(canvas)
        .to have_received(:print_line)
        .with('List of webpages with most page views ordered from most pages views to less page views')
        .ordered
      expect(canvas).to have_received(:print_same_line).with('/home 3 visits ').ordered
      expect(canvas).to have_received(:print_same_line).with('/about 2 visits ').ordered
      expect(canvas).to have_received(:print_line).with('').ordered
      expect(canvas)
        .to have_received(:print_line)
        .with('List of webpages with most unique page views also ordered')
        .ordered
      expect(canvas).to have_received(:print_line).with('/about 2 unique views').ordered
      expect(canvas).to have_received(:print_line).with('/home 1 unique views').ordered
    end
    # rubocop: enable RSpec/MultipleExpectations
    # rubocop: enable RSpec/ExampleLength
  end
end
