class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.text :tags
      t.boolean :premium
      t.string :status
      t.date :date_completed
      t.string :condition
      t.timestamps
    end
  end
end
