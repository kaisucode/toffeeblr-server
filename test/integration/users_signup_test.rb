require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do 
    assert_no_difference "User.count" do
      post users_path, params: { user: { username: "", 
                                         password: "" } }
    end
  end

  test "valid signup information" do 
    assert_difference "User.count", 1 do
      post users_path, params: { user: { username: "a_unique_username", 
                                         password: "123456" } }
    end
  end

end
