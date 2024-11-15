class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :loan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :payment_date
      t.decimal :amount
      t.decimal :interest_paid
      t.decimal :principal_paid
      t.string :status

      t.timestamps
    end
  end
end
