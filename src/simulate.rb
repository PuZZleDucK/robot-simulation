# frozen_string_literal: true

require_relative 'string_processor'
require_relative 'robot_field'

robot_field = RobotField.new
if ARGV.empty?
  input_line = 'nop'
  until input_line.empty?
    input_line = gets.chomp
    command = StringProcessor.parse(input_line)
    response = robot_field.simulate(command)
    puts response unless response.to_s.empty?
  end
else
  ARGV.each do |arg|
    File.foreach(arg) do |line|
      line.chomp!
      command = StringProcessor.parse(line)
      response = robot_field.simulate(command)
      puts response unless response.to_s.empty?
    end
  end
end
