# frozen_string_literal: true

# Simulates the robot postioning and state given valid inputs
class RobotField
  attr_accessor :width, :height, :hori, :vert, :dir

  def initialize
    @width = 6
    @height = 6
  end

  DIRECTIONS = {
    n: 0,
    e: 1,
    s: 2,
    w: 3
  }.freeze

  def simulate(command)
    return if command == :nop

    case command
    when :move
      move
    else
      place(command) if command[0] == :place
    end
  end

  def place(command)
    hori = command[1]
    vert = command[2]
    dir = command[3]
    unless [(0...@width).cover?(hori), (0...@height).cover?(vert), DIRECTIONS.include?(dir)].all?
      return
    end

    @hori = hori
    @vert = vert
    @dir = dir
  end

  def move
    case dir
    when :n
      @vert += 1 if vert < (height - 1)
    when :e
      @hori += 1 if hori < (width - 1)
    when :s
      @vert -= 1 if vert.positive?
    when :w
      @hori -= 1 if hori.positive?
    end
  end
end
