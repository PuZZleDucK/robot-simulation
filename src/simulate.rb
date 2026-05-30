# frozen_string_literal: true

if ARGV.empty?
  # interactive mode
  # robot_field = RobotField.new
  input_line = 'nop'
  until input_line.empty?
    input_line = gets.chomp
    # command = StringProcesor.parse(input_line)
    # response = robot_field.simulate(command)
    # puts response unless response.empty?
  end
else
  puts 'Process files'
end
