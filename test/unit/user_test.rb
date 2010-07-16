require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "test user with no name" do
    u = User.new
    u.password = "password"
    assert !u.save
  end

  test "test user with no password" do
    u = User.new
    u.name = "name"
    assert !u.save
  end

  test "test user save successful" do
    u = User.new
    u.password = "password"
    u.name = "name"
    assert u.save
  end

  test "login successful" do
    assert_not_nil User.authenticate("tim", "pword")
  end

  test "test user # followers" do
    assert_equal 1, users(:tim).friends.length
  end

  test "test user followers" do
    assert_equal "wee", users(:tim).friends.first.name
  end

  test "test timeline" do
    assert_equal 3, users(:tim).subscription_timeline.count
  end
end
