# frozen_string_literal: true

require_relative 'test_helper.rb'

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

  describe 'cli input' do
    it 'inline program runs and prints expected outputs' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb', 'r+') do |pipe|
        pipe.puts("PLACE 0,0,N\n")
        pipe.puts("MOVE\n")
        pipe.puts("MOVE\n")
        pipe.puts("RIGHT\n")
        pipe.puts("MOVE\n")
        pipe.puts("REPORT\n")
        pipe.puts("\n")
        pipe.close_write
        shell_output = pipe.read
      end
      _(shell_output.chomp).must_equal '1,2,E'
    end

    it 'path to program file 1 runs and prints expected outputs' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb examples/example1.rob', 'r+') do |pipe|
        shell_output = pipe.read
      end
      _(shell_output.chomp).must_equal '1,0,E'
    end

    it 'path to program file 2 runs and prints expected outputs' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb examples/example2.rob', 'r+') do |pipe|
        shell_output = pipe.read
      end
      _(shell_output.chomp).must_equal '1,2,E'
    end

    it 'path to 2 program files runs and prints expected outputs' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb examples/example1.rob examples/example2.rob', 'r+') do |pipe|
        shell_output = pipe.read
      end
      _(shell_output.chomp).must_equal "1,0,E\n1,2,E"
    end

    it 'glob to 2 program files runs and prints expected outputs' do
      shell_output = ''
      IO.popen('bundle exec ruby src/simulate.rb examples/*', 'r+') do |pipe|
        shell_output = pipe.read
      end
      _(shell_output[0..10]).must_equal "1,0,E\n1,2,E"
    end
  end
end
