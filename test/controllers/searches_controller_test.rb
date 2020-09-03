require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get user_search" do
    get searches_user_search_url
    assert_response :success
  end

  test "should get aea_search" do
    get searches_aea_search_url
    assert_response :success
  end
end
