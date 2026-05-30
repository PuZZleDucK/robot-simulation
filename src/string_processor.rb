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
              when 'PLACE'
                hori = components[1].to_i
                vert = components[2].to_i
                dir = DIRECTIONS[components[3]]
                [:place, hori, vert, dir] if hori.integer? && vert.integer? && dir.is_a?(Symbol)
              end
    command || :nop
  end
end

# could take single line and process piecemiel
# or
# take multiline string from file and prossess in loop
