require 'test_helper'

class GrantGatewayControllerTest < ActionController::TestCase
  test "should get data" do
    get :data
    assert_response :success
  end

end
