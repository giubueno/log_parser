# frozen_string_literal: true

module Utils
  # Abstract the terminal to improve testability.
  class Canvas
    def puts(content)
      puts content
    end

    def print(content)
      print content
    end
  end
end
