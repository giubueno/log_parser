require 'active_support'
require 'active_support/core_ext/object/blank'

module Parser
  def self.parse_line(line)
    return nil if line.blank?

    line.split(' ')[0]
  end

  def self.create_counter
  end
end