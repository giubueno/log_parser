# frozen_string_literal: true

require_relative './base_view'

module Views
  # View responsible for rendering the result.
  class ResultView < BaseView
    def render(paths)
      canvas.puts 'List of webpages with most page views ordered from most pages views to less page views:'
      sort_by_unique_page_views(paths)
        .each { |path| canvas.print "#{path.path} #{path.total} visits " }

      canvas.puts 'List of webpages with most unique page views also ordered:'
      sort_by_total_views(paths)
        .each { |path| canvas.puts "#{path.path} #{path.unique} unique views" }
    end

    private

    def sort_by_unique_page_views(paths)
      # sort in asc order and then reverse to desc order
      paths.sort_by(&:total).reverse
    end

    def sort_by_total_views(paths)
      # sort in asc order and then reverse to desc order
      paths.sort_by(&:unique).reverse
    end
  end
end
