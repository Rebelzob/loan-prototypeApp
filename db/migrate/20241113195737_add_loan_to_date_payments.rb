class AddLoanToDatePayments < ActiveRecord::Migration[8.0]
  def change
    add_reference :date_payments, :loan, null: false, foreign_key: true
  end
end
