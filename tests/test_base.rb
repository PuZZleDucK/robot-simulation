# frozen_string_literal: true

require 'minitest/autorun'

describe 'Base cases' do
  describe 'cli runs' do
    it 'exits with no input on return' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb', 'r+') do |pipe|
        pipe.puts("\n")
        pipe.close_write
        shell_output = pipe.read
      end
      _(shell_output.chomp).must_equal ''
    end
  end

  describe 'Tautology' do
    it '1 == 1' do
      _(1).must_equal 1
    end
  end
end
