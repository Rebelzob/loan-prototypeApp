class RenameClientIdToUserIdInDatePayments < ActiveRecord::Migration[8.0]
  def change
    rename_column :date_payments, :client_id, :user_id
  end
end
