require 'test_helper'

class ProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productos_index_url
    assert_response :success
  end

  test "should get show" do
    get productos_show_url
    assert_response :success
  end

  test "should get edit" do
    get productos_edit_url
    assert_response :success
  end

  test "should get delete" do
    get productos_delete_url
    assert_response :success
  end

end
