require 'test_helper'

class CommonControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
