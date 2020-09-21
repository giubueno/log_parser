# frozen_string_literal: true

require_relative './repositories/access_repository'
require_relative './services/parsers/line_parser'
require_relative './services/parsers/file_parser'
require_relative './presenters/parser_presenter'
require_relative './views/error_view'
require_relative './views/result_view'
require_relative './utils/canvas'

# Dependency injector that loads every component involved in the parsing process.
class Boostrap
  def initialize(filepath)
    repository = Repositories::AccessRepository.new
    line_parser = Services::Parsers::LineParser.new
    service = Services::Parsers::FileParser.new(filepath, repository, line_parser)
    canvas = Utils::Canvas.new
    error_view = Views::ErrorView.new(canvas)
    result_view = Views::ResultView.new(canvas)
    @presenter = Presenters::ParserPresenter.new(service, error_view, result_view)
  end

  def start
    presenter.start
  end

  private

  attr_accessor :presenter
end
