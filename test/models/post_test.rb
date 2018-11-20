require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "Posts without content_raw are not valid" do
    post = Post.new(title: "I am not a valid post", user_id: User.first)
    assert_equal false, post.valid?
  end
end
