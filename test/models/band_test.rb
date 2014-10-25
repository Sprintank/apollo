require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "basic band creation with identifier generator" do

    band = FactoryGirl.create(:band, :name => 'Explosions in the Sky')
    assert_equal 'explosions-in-the-sky', band.identifier
  end
end
