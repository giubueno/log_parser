# frozen_string_literal: true

module Models
  # Represents a log register.
  class Access
    attr_reader :path, :ip

    def initialize(path, ip)
      @path = path
      @ip = ip
    end
  end
end
