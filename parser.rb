# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/object/blank'
require 'ostruct'

# Parser module that contain a parse line method and a counter class
# to count the number of unique and non-unique access.
module Parser
  def self.parse_line(line)
    return nil if line.blank?

    tokens = line.split(' ')

    data = OpenStruct.new
    data.path = tokens[0]
    data.ip = tokens[1]

    data
  end

  class Counter
    def initialize
      @path_counters = {}
      @path_ip_counters = {}
    end

    def total_by_path(path)
      total = @path_counters[path]
      if total.nil?
        total = OpenStruct.new
        total.non_unique = 0
        total.unique = 0
      end

      total
    end

    def registered?(access)
    end

    def add(line)
      access = Parser::parse_line(line)
      register(access)
    end

    def totals(sorted_by = :unique, order = :desc)
      sorted_totals = @path_counters.sort_by do |key, total| 
        sorted_by == :unique ? total.unique : total.non_unique
      end
      sorted_totals = sorted_totals.reverse! if order == :desc
      sorted_totals
    end

    private

    def registered?(access)
      return false if @path_ip_counters[access.path].nil?
      return false if @path_ip_counters[access.path][access.ip].nil?

      true
    end

    def register(access)
      total = total_by_path(access.path)
      total.non_unique += 1

      if registered?(access)
        @path_ip_counters[access.path][access.ip] += 1
      else
        total.unique += 1
        @path_ip_counters[access.path] = {} if @path_ip_counters[access.path].nil?
        @path_ip_counters[access.path][access.ip] = 1
      end

      @path_counters[access.path] = total if @path_counters[access.path].nil?

      total
    end
  end
end
