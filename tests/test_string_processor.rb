# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/string_processor'

describe StringProcessor do
  it 'Parse blank sting returns nop' do
    _(StringProcessor.parse('')).must_equal :nop
  end

  describe 'PLACE' do
    it 'Parse simple North' do
      _(StringProcessor.parse('PLACE 0 0 N')).must_equal [:place, 0, 0, :n]
    end

    it 'Parse simple South' do
      _(StringProcessor.parse('PLACE 0 0 S')).must_equal [:place, 0, 0, :s]
    end

    it 'Parse simple East' do
      _(StringProcessor.parse('PLACE 0 0 E')).must_equal [:place, 0, 0, :e]
    end

    it 'Parse simple West' do
      _(StringProcessor.parse('PLACE 0 0 W')).must_equal [:place, 0, 0, :w]
    end

    it 'Parse North with horizontal offset' do
      _(StringProcessor.parse('PLACE 3 0 N')).must_equal [:place, 3, 0, :n]
    end

    it 'Parse North with large horizontal offset' do
      _(StringProcessor.parse('PLACE 33 0 N')).must_equal [:place, 33, 0, :n]
    end

    it 'Parse North with vertical offset' do
      _(StringProcessor.parse('PLACE 0 3 N')).must_equal [:place, 0, 3, :n]
    end

    it 'Parse North with large vertical offset' do
      _(StringProcessor.parse('PLACE 0 33 N')).must_equal [:place, 0, 33, :n]
    end

    it 'Parse North with two large offsets' do
      _(StringProcessor.parse('PLACE 22 33 N')).must_equal [:place, 22, 33, :n]
    end

    it 'Parse with invalid command gives nop' do
      _(StringProcessor.parse('RANDOM 22 33 N')).must_equal :nop
    end

    it 'Parse with invalid hori gives nop' do
      _(StringProcessor.parse('PLACE A 33 N')).must_equal :nop
    end

    it 'Parse with invalid vert gives nop' do
      _(StringProcessor.parse('RANDOM 22 Z N')).must_equal :nop
    end

    it 'Parse with invalid dir gives nop' do
      _(StringProcessor.parse('RANDOM 22 33 AAA')).must_equal :nop
    end
  end
end
