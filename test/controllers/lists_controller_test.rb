require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lists_new_url
    assert_response :success
  end

  test "should get create" do
    get lists_create_url
    assert_response :success
  end

  test "should get last_five" do
    get lists_last_five_url
    assert_response :success
  end

end
