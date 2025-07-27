require "test_helper"

class WardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wards_index_url
    assert_response :success
  end

  test "should get show" do
    get wards_show_url
    assert_response :success
  end

  test "should get new" do
    get wards_new_url
    assert_response :success
  end

  test "should get edit" do
    get wards_edit_url
    assert_response :success
  end
end
