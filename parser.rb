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

  def self.create_counter
  end
end