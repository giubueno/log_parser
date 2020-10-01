# frozen_string_literal: true

require_relative '../models/path'
require_relative '../models/ip'

module Repositories
  # Register all accesses
  class AccessRepository
    def initialize
      @paths = {}
      @ips = {}
    end

    # Registers a new access and update the path counter.
    def register(access)
      path_exists?(access.path) ? update_path(access) : add_path(access)
    end

    def accesses
      paths.values
    end

    private

    attr_accessor :paths, :ips

    def path_exists?(path)
      !paths[path].nil?
    end

    def add_path(access)
      registry = Models::Path.new(access.path, 1, 1)
      registry.ips[access.ip] = 1
      paths[access.path] = registry
    end

    def update_path(access)
      registry = paths[access.path]
      registry.increase_total

      if registry.ips[access.ip].nil?
        registry.ips[access.ip] = 1
        registry.increase_unique
      else
        registry.ips[access.ip] += 1
      end

      registry
    end
  end
end
