require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get auth_show_url
    assert_response :success
  end

  test "should get create" do
    get auth_create_url
    assert_response :success
  end

  test "should get destroy" do
    get auth_destroy_url
    assert_response :success
  end
end
