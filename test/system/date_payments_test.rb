require "application_system_test_case"

class DatePaymentsTest < ApplicationSystemTestCase
  setup do
    @date_payment = date_payments(:one)
  end

  test "visiting the index" do
    visit date_payments_url
    assert_selector "h1", text: "Date payments"
  end

  test "should create date payment" do
    visit date_payments_url
    click_on "New date payment"

    click_on "Create Date payment"

    assert_text "Date payment was successfully created"
    click_on "Back"
  end

  test "should update Date payment" do
    visit date_payment_url(@date_payment)
    click_on "Edit this date payment", match: :first

    click_on "Update Date payment"

    assert_text "Date payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Date payment" do
    visit date_payment_url(@date_payment)
    click_on "Destroy this date payment", match: :first

    assert_text "Date payment was successfully destroyed"
  end
end
