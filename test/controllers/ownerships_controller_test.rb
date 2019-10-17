require 'test_helper'

class OwnershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ownerships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get ownerships_destroy_url
    assert_response :success
  end

end
