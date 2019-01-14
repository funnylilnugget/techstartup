class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :premium
      t.integer :location_id
    end
    add_index :users, :email, unique: true
  end
end
