require 'active_support'
require 'active_support/core_ext/object/blank'
require 'ostruct'

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
      unless total = @path_counters[path]
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