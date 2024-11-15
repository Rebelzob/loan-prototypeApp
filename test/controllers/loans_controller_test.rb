require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
    @user = users(:one)
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
    assert_difference("Loan.count") do
      post loans_url, params: { loan: {user_id: @user.id, interest: 5.5, principal: 1000, duration: 12, status: "active", total_amount_to_pay: 1100, amount_paid: 0, pending_installments:10} }
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
    patch loan_url(@loan), params: { loan: { amount_paid: 6000.0 } }
    assert_redirected_to loan_url(@loan)
    @loan.reload
    assert_equal 6000.0, @loan.amount_paid
  end

  test "should destroy loan" do
    assert_difference("Loan.count", -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
