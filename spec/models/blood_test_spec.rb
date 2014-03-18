require 'spec_helper'

describe BloodTest do
  let(:test) { BloodTest.new }

  it 'should know if Hb is out of range' do
    test.hb = 300
    expect(test).not_to have_healthy_hb
  end
end
