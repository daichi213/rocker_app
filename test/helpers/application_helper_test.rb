require 'test_helper'

class ApplicationHelperTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "LockerApp"
  end

  test "full title helper" do
    # full_titleの返却値を比較する
    assert_equal full_title, @base_title
    assert_equal full_title("Help"), "Help | " + @base_title
  end
end
