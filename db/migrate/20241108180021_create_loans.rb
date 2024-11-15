class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.decimal :interest
      t.decimal :principal
      t.integer :paid_installments
      t.integer :pending_installments
      t.integer :duration
      t.string :status
      t.decimal :total_amount_to_pay
      t.decimal :amount_paid

      t.timestamps
    end
  end
end
