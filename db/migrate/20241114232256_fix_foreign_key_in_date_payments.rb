class FixForeignKeyInDatePayments < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :date_payments, :users
    add_foreign_key :date_payments, :users, column: :user_id
  end
end
