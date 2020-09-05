require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get receives_index" do
    get transactions_receives_index_url
    assert_response :success
  end

  test "should get leaves_index" do
    get transactions_leaves_index_url
    assert_response :success
  end

  test "should get receiving_index" do
    get transactions_receiving_index_url
    assert_response :success
  end

  test "should get leaving_index" do
    get transactions_leaving_index_url
    assert_response :success
  end

  test "should get receives_show" do
    get transactions_receives_show_url
    assert_response :success
  end

  test "should get leaves_show" do
    get transactions_leaves_show_url
    assert_response :success
  end

  test "should get receiving_show" do
    get transactions_receiving_show_url
    assert_response :success
  end

  test "should get leaving_show" do
    get transactions_leaving_show_url
    assert_response :success
  end

  test "should get transaction_history" do
    get transactions_transaction_history_url
    assert_response :success
  end

end
