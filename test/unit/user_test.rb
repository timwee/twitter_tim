require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
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

  test "test find existing user" do
    assert_equal 2, User.all.count
  end
end
