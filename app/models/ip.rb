# frozen_string_literal: true

module Models
  # Represents a log register.
  class Ip
    attr_reader :ip, :total, :paths

    def initialize(ip, total)
      @ip    = ip
      @total = total
      @paths = {}
    end

    private

    attr_writer :ip, :total, :paths
  end
end
