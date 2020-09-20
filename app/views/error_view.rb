# frozen_string_literal: true

require_relative './base_view'

module Views
  # View responsible for rendering an error.
  class ErrorView < BaseView
    def render(error)
      canvas.puts 'The following error has occurred.'
      canvas.puts error
    end
  end
end
