require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author_first_name: @book.author_first_name, author_last_name: @book.author_last_name, genre: @book.genre, image_url: @book.image_url, isbn: @book.isbn, language: @book.language, length: @book.length, material_type: @book.material_type, publish_year: @book.publish_year, reading_level: @book.reading_level, series: @book.series, series_number: @book.series_number, subject: @book.subject, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author_first_name: @book.author_first_name, author_last_name: @book.author_last_name, genre: @book.genre, image_url: @book.image_url, isbn: @book.isbn, language: @book.language, length: @book.length, material_type: @book.material_type, publish_year: @book.publish_year, reading_level: @book.reading_level, series: @book.series, series_number: @book.series_number, subject: @book.subject, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
