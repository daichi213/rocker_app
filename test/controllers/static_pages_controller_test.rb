require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "ホームページへのアクセス" do
    get root_url
    assert_response :success
  end

  test "aboutページへのアクセス" do
    get about_url
    assert_response :success
  end

end
