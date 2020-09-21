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
      register = Models::Path.new(access.path, 1, 1)
      register.ips[access.ip] = 1
      paths[access.path] = register
    end

    def update_path(access)
      register = paths[access.path]
      register.increase_total

      if register.ips[access.ip].nil?
        register.ips[access.ip] = 1
        register.increase_unique
      else
        register.ips[access.ip] += 1
      end

      register
    end
  end
end
