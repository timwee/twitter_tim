require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should redirect to login" do
    post :create, :tweet => users(:tim).tweets.create.to_param
    assert_redirected_to login_url
  end

end
