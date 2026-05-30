# frozen_string_literal: true

require 'minitest/autorun'

describe 'Base cases' do
  #   describe "Contradition" do
  #     it "1 1= 1" do
  #       _(1).wont_equal 1
  #     end
  #   end

  describe 'Tautology' do
    it '1 == 1' do
      _(1).must_equal 1
    end
  end
end
