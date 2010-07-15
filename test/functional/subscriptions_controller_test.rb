require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  test "should redirect to login" do
    post :create, :friend_id => users(:tim).to_param
    assert_redirected_to login_url
  end

  test "follow succeeds when user is logged in" do
    assert_difference('users(:tim).friends.count') do
      session[:user_id] = users(:tim).id
      post :create, :friend_id => users(:three).to_param
    end
  end
end
