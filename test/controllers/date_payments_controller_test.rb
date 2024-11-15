require "test_helper"

class DatePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_payment = date_payments(:one)
    @user = users(:one)
    @loan = loans(:one)
  end

  test "should get index" do
    get date_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_date_payment_url
    assert_response :success
  end

  test "should create date_payment" do
    assert_difference("DatePayment.count") do
      post date_payments_url, params: { date_payment: {
        user_id: @user.id,
        loan_id: @loan.id,
        collection_id: 1,
        payment_due_date: "2024-12-01",
        loan_start_date: "2024-11-01",
        final_payment_date: "2025-11-01"
      } }
    end

    assert_redirected_to date_payment_url(DatePayment.last)
  end

  test "should show date_payment" do
    get date_payment_url(@date_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_payment_url(@date_payment)
    assert_response :success
  end

  test "should update date_payment" do
    patch date_payment_url(@date_payment), params: { date_payment: {
      payment_due_date: "2024-12-15"
    } }
    assert_redirected_to date_payment_url(@date_payment)
    @date_payment.reload
    assert_equal "2024-12-15", @date_payment.payment_due_date.to_date.to_s
  end

  test "should destroy date_payment" do
    assert_difference("DatePayment.count", -1) do
      delete date_payment_url(@date_payment)
    end

    assert_redirected_to date_payments_url
  end
end
