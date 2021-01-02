require 'test_helper'

class NetasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get netas_index_url
    assert_response :success
  end

  test "should get show" do
    get netas_show_url
    assert_response :success
  end

  test "should get new" do
    get netas_new_url
    assert_response :success
  end

  test "should get edit" do
    get netas_edit_url
    assert_response :success
  end

end
