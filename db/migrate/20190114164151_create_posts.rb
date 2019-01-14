class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.text :tags
      t.boolean :premium
      t.timestamps
      t.string :redeemed
    end
  end
end
