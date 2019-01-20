class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :identifier
      t.integer :post_id
      t.timestamps
    end
  end
end
