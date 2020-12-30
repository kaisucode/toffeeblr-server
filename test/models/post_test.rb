require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    # @user = User.new(username: "test user", password: "password")
    # @user.save
    @user = users(:one)
    @post = @user.posts.build(title: "a post!!", content: "lorem ipsum")
    # @post = Post.new(title: "a post!!", content: "lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = " "
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
