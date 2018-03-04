require 'test_helper'

class HoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hold = holds(:one)
  end

  test "should get index" do
    get holds_url
    assert_response :success
  end

  test "should get new" do
    get new_hold_url
    assert_response :success
  end

  test "should create hold" do
    assert_difference('Hold.count') do
      post holds_url, params: { hold: { book_id: @hold.book_id, release_date: @hold.release_date, request_date: @hold.request_date, user_id: @hold.user_id } }
    end

    assert_redirected_to hold_url(Hold.last)
  end

  test "should show hold" do
    get hold_url(@hold)
    assert_response :success
  end

  test "should get edit" do
    get edit_hold_url(@hold)
    assert_response :success
  end

  test "should update hold" do
    patch hold_url(@hold), params: { hold: { book_id: @hold.book_id, release_date: @hold.release_date, request_date: @hold.request_date, user_id: @hold.user_id } }
    assert_redirected_to hold_url(@hold)
  end

  test "should destroy hold" do
    assert_difference('Hold.count', -1) do
      delete hold_url(@hold)
    end

    assert_redirected_to holds_url
  end
end
