# frozen_string_literal: true

require_relative '../exceptions/parser_exception'

module Presenters
  # Presenter responsible to coordinate the parsing process.
  class ParserPresenter
    def initialize(parser_service, error_view, result_view)
      @error_view = error_view
      @result_view = result_view
      @parser_service = parser_service
    end

    def start
      totals = parser_service.parse
      result_view.render(totals)
    rescue StandardError => e
      error_view.render(e)
    end

    private

    attr_accessor :error_view, :result_view, :parser_service
  end
end
