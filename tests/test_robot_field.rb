# frozen_string_literal: true

require_relative 'test_helper.rb'
require_relative '../src/robot_field'

describe RobotField do
  it 'Create' do
    subject = RobotField.new
    _(subject.class.to_s).must_equal 'RobotField'
    _(subject.width).must_equal 6
    _(subject.height).must_equal 6
    assert_nil(subject.hori)
    assert_nil(subject.vert)
    assert_nil(subject.dir)
  end

  describe 'PLACE' do
    it 'facing north' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :n
    end

    it 'facing east' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :e])
      _(subject.dir).must_equal :e
    end

    it 'facing south' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :s])
      _(subject.dir).must_equal :s
    end

    it 'facing west' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :w])
      _(subject.dir).must_equal :w
    end

    it 'at mid height max width' do
      subject = RobotField.new
      subject.simulate([:place, 5, 2, :e])
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 2
    end

    it 'at mid width max height' do
      subject = RobotField.new
      subject.simulate([:place, 2, 5, :e])
      _(subject.hori).must_equal 2
      _(subject.vert).must_equal 5
    end

    it 'at max height/width' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :e])
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 5
    end

    it 'at mid height/width facing south' do
      subject = RobotField.new
      subject.simulate([:place, 2, 2, :s])
      _(subject.hori).must_equal 2
      _(subject.vert).must_equal 2
      _(subject.dir).must_equal :s
    end

    it 'invalid high hori place ignored' do
      subject = RobotField.new
      subject.simulate([:place, 6, 0, :n])
      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
    end

    it 'invalid low hori place ignored' do
      subject = RobotField.new
      subject.simulate([:place, -1, 0, :n])
      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
    end

    it 'invalid high vert place ignored' do
      subject = RobotField.new
      subject.simulate([:place, 0, 6, :n])
      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
    end

    it 'invalid low vert place ignored' do
      subject = RobotField.new
      subject.simulate([:place, 0, -1, :n])
      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
    end

    it 'invalid dir ignored' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :z])
      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
    end
  end

  describe 'MOVE' do
    it 'move from bottom left facing north moves up' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      subject.simulate(:move)
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 1
      _(subject.dir).must_equal :n
    end

    it 'move from bottom left facing east moves right' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :e])
      subject.simulate(:move)
      _(subject.hori).must_equal 1
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :e
    end

    it 'move from top right facing south moves down' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :s])
      subject.simulate(:move)
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 4
      _(subject.dir).must_equal :s
    end

    it 'move from top right facing west moves left' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :w])
      subject.simulate(:move)
      _(subject.hori).must_equal 4
      _(subject.vert).must_equal 5
      _(subject.dir).must_equal :w
    end

    it 'move from bottom left facing south does not move' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :s])
      subject.simulate(:move)
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :s
    end

    it 'move from bottom left facing west does not move' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :w])
      subject.simulate(:move)
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :w
    end

    it 'move from top right facing north does not move' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :n])
      subject.simulate(:move)
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 5
      _(subject.dir).must_equal :n
    end

    it 'move from top right facing east does not move' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :e])
      subject.simulate(:move)
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 5
      _(subject.dir).must_equal :e
    end
  end

  describe 'LEFT and RIGHT' do
    it 'turn left from bottom left facing north faces west and rotates around compass' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      subject.simulate(:left)
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :w

      subject.simulate(:left)
      _(subject.dir).must_equal :s

      subject.simulate(:left)
      _(subject.dir).must_equal :e

      subject.simulate(:left)
      _(subject.dir).must_equal :n
    end

    it 'turn right from bottom left facing north faces east and rotates around compass' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      subject.simulate(:right)
      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :e

      subject.simulate(:right)
      _(subject.dir).must_equal :s

      subject.simulate(:right)
      _(subject.dir).must_equal :w

      subject.simulate(:right)
      _(subject.dir).must_equal :n
    end
  end

  describe 'REPORT' do
    it 'facing north in bottom left reports (0, 0, N)' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      output = subject.simulate(:report)
      _(output).must_equal '0,0,N'
    end

    it 'facing west in top right reports (5, 5, W)' do
      subject = RobotField.new
      subject.simulate([:place, 5, 5, :w])
      output = subject.simulate(:report)
      _(output).must_equal '5,5,W'
    end

    it 'facing south in bottom right reports (5, 0, S)' do
      subject = RobotField.new
      subject.simulate([:place, 5, 0, :s])
      output = subject.simulate(:report)
      _(output).must_equal '5,0,S'
    end

    it 'facing east in top left reports (0, 5, E)' do
      subject = RobotField.new
      subject.simulate([:place, 0, 5, :e])
      output = subject.simulate(:report)
      _(output).must_equal '0,5,E'
    end
  end

  describe 'Compound commands' do
    it 'Traverses the field' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:right)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      subject.simulate(:move)
      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 5
      _(subject.dir).must_equal :e
    end

    it 'ignores invalid place commands' do
      subject = RobotField.new
      subject.simulate([:place, 6, 0, :n])

      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)

      subject.simulate([:place, -1, 0, :n])

      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)

      subject.simulate([:place, 0, 6, :n])

      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)

      subject.simulate([:place, 6, 0, :z])

      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)

      subject.simulate([:place, 0, 0, :n])

      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :n
    end

    it 'ignores move, trun and report commands before valid place' do
      subject = RobotField.new
      subject.simulate(:move)
      subject.simulate(:left)
      subject.simulate(:right)
      invalid_report_output = subject.simulate(:report)

      assert_nil(subject.hori)
      assert_nil(subject.vert)
      assert_nil(subject.dir)
      assert_nil(invalid_report_output)

      subject.simulate([:place, 0, 0, :n])

      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :n
    end

    it 'accepts multiple place commands' do
      subject = RobotField.new
      subject.simulate([:place, 0, 0, :n])

      _(subject.hori).must_equal 0
      _(subject.vert).must_equal 0
      _(subject.dir).must_equal :n

      subject.simulate([:place, 3, 2, :e])

      _(subject.hori).must_equal 3
      _(subject.vert).must_equal 2
      _(subject.dir).must_equal :e

      subject.simulate([:place, 5, 5, :w])

      _(subject.hori).must_equal 5
      _(subject.vert).must_equal 5
      _(subject.dir).must_equal :w
    end
  end
end
