# frozen_string_literal: true

require_relative './base_view'

module Views
  # View responsible for rendering the result.
  class ResultView < BaseView
    def render(paths)
      render_by_total_view(paths)
      canvas.print_line '' # print an empty line
      render_by_unique_view(paths)
    end

    private

    def render_by_total_view(paths)
      canvas.print_line 'List of webpages with most page views ordered from most pages views to less page views'
      paths = sort(paths)
      paths.each { |path| canvas.print_same_line "#{path.path} #{path.total} visits " }
    end

    def render_by_unique_view(paths)
      canvas.print_line 'List of webpages with most unique page views also ordered'
      paths = sort(paths, by_unique: true)
      paths.each { |path| canvas.print_line "#{path.path} #{path.unique} unique views" }
    end

    def sort(paths, by_unique: false)
      # sort in asc order and..
      paths = by_unique ? paths.sort_by(&:unique) : paths.sort_by(&:total)
      # then reverse to desc order
      paths.reverse
    end
  end
end
