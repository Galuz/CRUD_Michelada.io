require 'test_helper'

class MarcasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marcas_index_url
    assert_response :success
  end

  test "should get show" do
    get marcas_show_url
    assert_response :success
  end

  test "should get new" do
    get marcas_new_url
    assert_response :success
  end

  test "should get create" do
    get marcas_create_url
    assert_response :success
  end

  test "should get edit" do
    get marcas_edit_url
    assert_response :success
  end

  test "should get update" do
    get marcas_update_url
    assert_response :success
  end

  test "should get delete" do
    get marcas_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get marcas_destroy_url
    assert_response :success
  end

end
