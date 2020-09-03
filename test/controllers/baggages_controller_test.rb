require 'test_helper'

class BaggagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get baggages_new_url
    assert_response :success
  end

  test "should get index" do
    get baggages_index_url
    assert_response :success
  end

  test "should get receives" do
    get baggages_receives_url
    assert_response :success
  end

  test "should get received" do
    get baggages_received_url
    assert_response :success
  end
end
