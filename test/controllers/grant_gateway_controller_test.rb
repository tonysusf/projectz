require 'test_helper'

class GrantGatewayControllerTest < ActionController::TestCase
  test "#data" do
    get :data, :format => :json
    assert_response :success
  end

  test "#search" do
    get :search, :format => :json
    assert_response :success
  end
end
