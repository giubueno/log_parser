# frozen_string_literal: true

module Views
  # Base view class.
  class BaseView
    def initialize(canvas)
      @canvas = canvas
    end

    def render(data)
      raise NotImplementedError, "You must implement render. Data: #{data}"
    end

    protected

    attr_accessor :canvas
  end
end
