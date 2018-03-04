require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { book_id: @loan.book_id, date_borrowed: @loan.date_borrowed, date_returned: @loan.date_returned, due_date: @loan.due_date, fine: @loan.fine, fine_paid_date: @loan.fine_paid_date, overdue: @loan.overdue, renewed_count: @loan.renewed_count, user_id: @loan.user_id } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { book_id: @loan.book_id, date_borrowed: @loan.date_borrowed, date_returned: @loan.date_returned, due_date: @loan.due_date, fine: @loan.fine, fine_paid_date: @loan.fine_paid_date, overdue: @loan.overdue, renewed_count: @loan.renewed_count, user_id: @loan.user_id } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
