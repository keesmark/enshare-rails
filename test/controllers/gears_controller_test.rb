require 'test_helper'

class GearsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gears_create_url
    assert_response :success
  end

  test "should get destroy" do
    get gears_destroy_url
    assert_response :success
  end

end
