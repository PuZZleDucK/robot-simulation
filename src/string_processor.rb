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
    components = string.split
    command = case components[0]
              when 'MOVE'
                :move
              when 'PLACE'
                hori = safe_to_i(components[1])
                vert = safe_to_i(components[2])
                dir = DIRECTIONS[components[3]]
                return :nop if [hori.nil?, vert.nil?, !dir.is_a?(Symbol)].any?

                [:place, hori, vert, dir]
              end
    command || :nop
  end

  def self.safe_to_i(value)
    Integer(value)
  rescue ArgumentError, TypeError
    nil
  end
end

# could take single line and process piecemiel
# or
# take multiline string from file and prossess in loop
