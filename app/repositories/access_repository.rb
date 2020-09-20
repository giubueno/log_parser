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
      ip_exists?(access.ip)     ? update_ip(access)   : add_ip(access)
      path_exists?(access.path) ? update_path(access) : add_path(access)
    end

    def accesses
      paths.values
    end

    private

    attr_accessor :paths, :ips

    def ip_exists?(ip)
      !ips[ip].nil?
    end

    def add_ip(access)
      register = Models::Ip.new(access.ip, 1)
      register.paths[access.path] = 1
      ips[access.ip] = register
    end

    def update_ip(access)
      register = ips[access.ip]
      register.paths[access.path] += 1
      register
    end

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
