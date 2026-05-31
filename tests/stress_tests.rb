require 'minitest/autorun'
require 'minitest/benchmark'
require_relative '../src/robot_field'

class TestAlgorithmStress < Minitest::Benchmark

  def self.bench_ranges
    [10_000, 100_000, 1_000_000, 10_000_000]
  end

  def bench_random_commands
    assert_performance_power(0.3) do |n|
      100.times do
        subject = RobotField.new
        case rand(0..4)
        when 0
          subject.simulate([:place, 0, 0, :n])
          subject.simulate(:move)
          subject.simulate(:report)
        when 1
          subject.simulate([:place, 1, 4, :e])
          subject.simulate(:move)
          subject.simulate(:report)
        when 2
          subject.simulate([:place, 2, 3, :w])
          subject.simulate(:move)
          subject.simulate(:report)
        when 3
          subject.simulate([:place, 5, 5, :s])
          subject.simulate(:move)
          subject.simulate(:report)
        when 4
          subject.simulate([:place, 5, 0, :x])
          subject.simulate(:move)
          subject.simulate(:report)
        end
      end
    end
  end
end