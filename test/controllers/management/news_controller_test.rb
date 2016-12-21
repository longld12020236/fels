require 'test_helper'

class Management::NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get management_news_show_url
    assert_response :success
  end

  test "should get index" do
    get management_news_index_url
    assert_response :success
  end

  test "should get edit" do
    get management_news_edit_url
    assert_response :success
  end

end
