require 'test_helper'

class BandsControllerTest < ActionController::TestCase
  test "public show" do
    band = FactoryGirl.create(:band, :name => 'Explosions in the Sky')
    get(:show, id: band.identifier)
    assert_response 200
  end
end
