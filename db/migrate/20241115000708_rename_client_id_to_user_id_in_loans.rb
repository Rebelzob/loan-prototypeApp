class RenameClientIdToUserIdInLoans < ActiveRecord::Migration[8.0]
  def up
    if foreign_key_exists?(:loans, :users, column: :client_id)
      remove_foreign_key :loans, :users, column: :client_id
    end

    rename_column :loans, :client_id, :user_id

    add_foreign_key :loans, :users, column: :user_id

    if index_exists?(:loans, :client_id)
      remove_index :loans, :client_id
    end

    unless index_exists?(:loans, :user_id)
      add_index :loans, :user_id
    end
  end

  def down
    if foreign_key_exists?(:loans, :users, column: :user_id)
      remove_foreign_key :loans, :users, column: :user_id
    end

    rename_column :loans, :user_id, :client_id

    add_foreign_key :loans, :users, column: :client_id

    if index_exists?(:loans, :user_id)
      remove_index :loans, :user_id
    end

    unless index_exists?(:loans, :client_id)
      add_index :loans, :client_id
    end
  end
end
