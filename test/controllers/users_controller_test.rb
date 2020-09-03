require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "ログインなしでのユーザー一覧ページへのアクセス" do
    get users_path
    assert_redirected_to login_url
  end

  test "新規登録ページへのアクセス" do
    get signup_path
    assert_response :success
  end

  test "ログインなしでのユーザー編集ページへのアクセス" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "ログインなしでのユーザー編集(patchメソッド)へのアクセス" do
    patch user_path(@user), params: {user: {name: @user.name,
                                            email: @user.email}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "管理者権限管理機能テスト" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {user: {password: 'password',
                                                  password_confirmation: 'password',
                                                  admin: true}}
    assert_not @other_user.admin?
  end

  test "他ユーザーによるユーザー情報編集禁止" do
    log_in_as @other_user
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "他ユーザーによるユーザー情報編集禁止(patchメソッド側)" do
    log_in_as @other_user
    patch user_path(@user), params: {user: {name: @user.name,
                                            email: @user.email}}
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "ユーザー削除機能テスト" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test "管理者以外によるユーザー削除禁止" do
    log_in_as @other_user
    assert_no_difference "User.count" do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "ログインなしでのフォローユーザー一覧ページへのアクセス" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  test "ログインなしでのフォロワーユーザー一覧ページへのアクセス" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end
