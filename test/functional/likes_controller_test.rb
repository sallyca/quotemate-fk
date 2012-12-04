require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get like" do
    get :like
    assert_response :success
  end

end
