require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test "test username filled in" do
    t = users(:tim).tweets.create
    t.body = "body"
    t.save!
    assert_equal users(:tim).name, t.username
  end
end
