require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
