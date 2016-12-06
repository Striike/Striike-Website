require 'test_helper'

class ProsInscrControllerTest < ActionController::TestCase
  test "should get inscription" do
    get :inscription
    assert_response :success
  end

end
