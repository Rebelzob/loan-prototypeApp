class CreateDatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :date_payments do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.integer :collection_id
      t.datetime :payment_due_date
      t.datetime :loan_start_date
      t.datetime :final_payment_date

      t.timestamps
    end
  end
end
