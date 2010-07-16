require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should redirect to login" do
    post :create, :tweet => users(:tim).tweets.create.to_param
    assert_redirected_to login_url
  end

  test "create when logged in" do
    current_user = users(:tim)
    assert_difference('current_user.tweets.count') do
      session[:user_id] = current_user.id
      t = Tweet.new
      t.user = current_user
      t.body = "hi"
      post :create, :tweet => t.to_param
    end
    assert_nil flash[:notice]
    assert_redirected_to timeline_url
  end
end
