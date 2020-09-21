# frozen_string_literal: true

module Utils
  # Abstract the terminal to improve testability.
  class Canvas
    def print_line(content)
      puts content
    end

    def print_same_line(content)
      print content
    end
  end
end
