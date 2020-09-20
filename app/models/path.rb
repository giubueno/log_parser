# frozen_string_literal: true

module Models
  # Represents a log register.
  class Path
    attr_reader :path, :total, :unique, :ips

    def initialize(path, total, unique)
      @path   = path
      @total  = total
      @unique = unique
      @ips    = {}
    end

    def increase_total
      @total += 1
    end

    def increase_unique
      @unique += 1
    end
  end
end
