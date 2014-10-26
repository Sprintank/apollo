require 'test_helper'

class UserTest < ActiveSupport::TestCase

  describe "user creation" do
    # context "from omniauth" do
    #   before :each do
    #     OmniAuth.config.test_mode = true
    #     OmniAuth.config.mock_auth[:soundcloud] = OmniAuth::AuthHash.new({
    #       :provider => 'soundcloud',
    #       :uid => '123545',
    #       :credentials => {:token => 'asdfasdf'},
    #       :info => {:nickname=>"jose",:image=>"http://myimageurl.com",:name=>"billy jean"},
    #       :extra => {:raw_info=>{:country=>"Kazakstan",:city=>"Kazak",:uri=>"http://fakesoundcloud.com/userfaker"}}
    #     })
    #     auth = OmniAuth.config.mock_auth[:soundcloud]
    #     @user = User.from_omniauth(auth)
    #   end
    #   it "creates a new user from omniauth hash" do
    #     assert @user.valid?
    #   end
    #   it "is not able to access a band, without permissions" do
    #     band = FactoryGirl.create(:band)
    #     assert_equal false, @user.has_admin?(band)
    #   end
    #   it "is able to access a band, after admin is granted" do
    #     band = FactoryGirl.create(:band)
    #     @user.grant_admin(band)
    #     assert_equal true, @user.has_admin?(band)
    #   end
    # end
  end

end