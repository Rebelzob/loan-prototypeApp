class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.text :address
      t.string :name
      t.string :last_name
      t.string :email
      t.text :comments

      t.timestamps
    end
  end
end
