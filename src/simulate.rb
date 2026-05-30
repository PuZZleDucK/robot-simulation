# frozen_string_literal: true

require_relative 'string_processor'
require_relative 'robot_field'

if ARGV.empty?
  # interactive mode
  robot_field = RobotField.new
  input_line = 'nop'
  until input_line.empty?
    input_line = gets.chomp
    command = StringProcessor.parse(input_line)
    robot_field.simulate(command)
    # puts response unless response.empty?
  end
else
  puts 'Process files'
end
