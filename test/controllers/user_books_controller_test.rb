require 'test_helper'

class UserBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_book = user_books(:one)
  end

  test "should get index" do
    get user_books_url
    assert_response :success
  end

  test "should get new" do
    get new_user_book_url
    assert_response :success
  end

  test "should create user_book" do
    assert_difference('UserBook.count') do
      post user_books_url, params: { user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id } }
    end

    assert_redirected_to user_book_url(UserBook.last)
  end

  test "should show user_book" do
    get user_book_url(@user_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_book_url(@user_book)
    assert_response :success
  end

  test "should update user_book" do
    patch user_book_url(@user_book), params: { user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id } }
    assert_redirected_to user_book_url(@user_book)
  end

  test "should destroy user_book" do
    assert_difference('UserBook.count', -1) do
      delete user_book_url(@user_book)
    end

    assert_redirected_to user_books_url
  end
end
