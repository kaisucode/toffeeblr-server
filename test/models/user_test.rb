require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(username: "test user", password: "password")
  end

  test "valid user creation" do
    assert User.new(username: "hello", password: "123456").valid?
  end

  test "usernames should not be empty" do
    assert_not User.new(username: "", password: "123456").valid?
    assert User.new(username: "a", password: "123456").valid?
  end

  test "usernames should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username and password max length of 20 characters" do
    assert User.new(username: "hello", password: "a" * 20).valid?
    assert User.new(username: "a" * 20, password: "123456").valid?
    assert_not User.new(username: "hello", password: "a" * 21).valid?
    assert_not User.new(username: "a" * 21, password: "123456").valid?
  end

  test "passwords should be at least three characters long" do
    assert_not User.new(username: "hello", password: "12").valid?
    assert User.new(username: "hello", password: "12345").valid?
    assert User.new(username: "hello", password: "123456").valid?
  end

  test "associated posts should be destroyed" do
    @user.save
    @user.posts.create(title: "hi", content: "hello")
    assert_difference 'Post.count', -1 do
      @user.destroy
    end
  end
end
