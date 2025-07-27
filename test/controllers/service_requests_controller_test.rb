require "test_helper"

class ServiceRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get service_requests_show_url
    assert_response :success
  end

  test "should get new" do
    get service_requests_new_url
    assert_response :success
  end

  test "should get edit" do
    get service_requests_edit_url
    assert_response :success
  end
end
