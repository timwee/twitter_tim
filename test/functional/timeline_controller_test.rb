require 'test_helper'

class TimelineControllerTest < ActionController::TestCase
  test "timeline for tim" do
    session[:user_id] = users(:tim).id
    get :index
    assert_response :success
  end
end
