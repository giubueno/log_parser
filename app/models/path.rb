# frozen_string_literal: true

module Models
  # Represents a log register.
  class Path
    attr_reader :path, :total, :unique, :ips

    def initialize(path, total, unique)
      self.path   = path
      self.total  = total
      self.unique = unique
      @ips    = {}
    end

    def increase_total
      @total += 1
    end

    def increase_unique
      @unique += 1
    end

    def average
      total.to_f / unique.to_f
    end

    private

    attr_writer :path, :total, :unique, :ips
  end
end
