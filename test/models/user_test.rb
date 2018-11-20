require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User with uesrname, email and password is valid" do
    greg = User.new(email: "house@md.com", username: "lala", password: "lololo")
    assert_equal true, greg.valid?
  end

  test "User without username is not valid" do
    richard = User.new(email: "feynman@rocks.com", password: "magnets")
    assert_equal false, richard.valid?
  end
end
