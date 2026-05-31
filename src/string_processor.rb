# frozen_string_literal: true

# Process text into commands for the robot simulator
class StringProcessor
  DIRECTIONS = {
    'N' => :n,
    'E' => :e,
    'S' => :s,
    'W' => :w
  }.freeze

  def self.parse(string)
    components = string.gsub(',', ' ').split
    command = case components[0]
              when 'MOVE'
                :move
              when 'LEFT'
                :left
              when 'RIGHT'
                :right
              when 'REPORT'
                :report
              when 'PLACE'
                hori = safe_to_i(components[1])
                vert = safe_to_i(components[2])
                dir = DIRECTIONS[components[3]]
                [:place, hori, vert, dir] unless [hori.nil?, vert.nil?, !dir.is_a?(Symbol)].any?
              end
    command || :nop
  end

  def self.safe_to_i(value)
    Integer(value)
  rescue ArgumentError, TypeError
    nil
  end
end
